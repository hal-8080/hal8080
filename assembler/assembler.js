/*
#             HAL8080 Processor               #
# Kasper, Dennis, Tjeerd, Nick, Oussama 2020  #
#                 Assembler                   #
#   Assembler in javascript for AssemblyHal   #
# Assembler is 80% regex 20% javascript - khm #
*/

// Note for philosophy:
// Let's keep this assembler simple
// Each instruction lives in 16 bits
// The 16 bits must always be filled.
// PUT expects 16 bits -> directly to memory
// SETHI/SETLO expects 8 bits
// Arithmetic expects 5 bits
// Other inputs can only be fixed with registers
// $rA and $dA are reserved for us to fix this.
// The first pass is to add instructions for this.

//==========================================\\
//                 PREVARS                  \\
//==========================================\\

// Load usefull addresses in for every user.
let preVars = [
    ["@_BIOS_@",         0],
    ["@_RAM_@",       8192],
    ["@_DISPLAY_@",  57344],
    ["@_SEG01_@",    57344],
    ["@_SEG23_@",    57346],
    ["@_SEG45_@",    57348],
    ["@_LEDS_@",     57350],
    ["@_SWITCHES_@", 57352],
    ["@_BUTTONS_@",  57354],
    ["@_MILLIS_@",   57356],
    ["@_DEBUG_@",    57358],
    ["@_ATIMER1_@",  57360],
    ["@_TIMER1_@",   57362],
    ["@_ATIMER2_@",  57364],
    ["@_TIMER2_@",   57366]
]

//==========================================\\
//                   CODES                  \\
//==========================================\\

const registers = {
    // R       NUM
    "r0":     "0000",
    "r1":     "0001",
    "r2":     "0010",
    "r3":     "0011",
    "r4":     "0100",
    "r5":     "0101",
    "r6":     "0110",
    "r7":     "0111",
    "r8":     "1000",
    "r9":     "1001",
    "rA":     "1010", // Assembly reserved
    "rB":     "1011",
    "rC":     "1100",
    "rD":     "1101",
    "rE":     "1110",
    "rF":     "1111",
    "RET":    "0000", // Start over
    "m1":     "0001",
    "m2":     "0010",
    "m3":     "0011",
    "dA":     "0100", // Assembly reserved
    "dB":     "0101",
    "dC":     "0110",
    "dD":     "0111",
    "dE":     "1000",
    "dF":     "1001",
    "dAD":    "1010",
    "dVAL":   "1011",
    "dPC":    "1100",
    "dIR":    "1101",
    "PC":     "1110",
    "IR":     "1111",

};
const instArithmetic = { //00
    //INST   F 1234
    "AND":    "0000",
    "NAND":   "0001",
    "OR" :    "0010",
    "ORN":    "0011",
    "ADD":    "0100",
    "MUL":    "0101", 
    "DIV":    "0110",
    "XOR":    "0111",
    "SHIFTL": "1000",
    "SHIFTR": "1001",
    "INV":    "1010",
    "POW":    "1011",
    "SUB":    "1100",
    "DLUT":   "1101", //Display lookup (not used?)
    "CP":     "1110",
    "RAND":   "1111"
}
const instMemory = { //01
    //I   l/s
    "LD": "0",
    "ST": "1"
}
const instDisp = { //10
    //INST OP3 H/C
    "DISPCL":  ["10", "-"],
    "DISPCM":  ["01", "-"],
    "DISPCR":  ["00", "-"],
    "DISPRCL": ["10", "0"],
    "DISPRCM": ["01", "0"],
    "DISPRCR": ["00", "0"],
    "DISPRHL": ["10", "1"],
    "DISPRHR": ["00", "1"]
}
const instBranch = { //11-i0
    //INST    COND
    "BNEG":  "0000",
    "BZERO": "0010",
    "BA":    "0100",
    "CALL":  "0110",
    "RET":   "1000"
}
const instSet = { //11-i1
    //INST   H/L
    "SETHI": "0",
    "SETLO": "1"
}

//==========================================\\
//                   UTILS                  \\
//==========================================\\

const regexPreamble = /(#(?:.|\n#)*)/m;
const regexEmptyOrComment = /^\s*(?:#.*)?\s*/g;
const regexComment = /#.*/g;
const regexAddress = /(?<address>@(?<aLabel>\w+)(?<aVar>@)?(?<aHiLo>[<>])?)/g;
const regexConstant = /(?<hex>x"(?<hexval>[0-9A-F]+)")|(?<bin>"(?<binval>[01]+)")|(?<dec>\d+)/;
const regex2Constant = /(?<C1>(?:x"(?:[0-9A-F]+)")|(?:"(?:[01]+)")|(?:\d+))\s*,?\s*(?<C2>(?:x"(?:[0-9A-F]+)")|(?:"(?:[01]+)")|(?:\d+))?/;
const masterRegex = /^(?<label>(?<lLabel>\w+):)?\s*(?<instruction>[A-Z]*)?\s*(?<Rd>\$(?<RdN>\w+))?\s*,?\s*(?<Rs>\$(?<RsN>\w+))?(?<address>@(?<aLabel>\w+)(?<aVar>@)?(?<aHiLo>[<>])?)?\s*(?<cAssign>=)?\s*(?<C>\d+|"(?:[01]{1,5}|[01]{8}|[01]{16})"|x"(?:[0-9A-F]{1,2}|[0-9A-F]{4})")?/;

/***
 * Converts assemblyhal constant type to a number.
 * @param {string} str - The string that contains the constant.
 * @param {number} linenum - For errors :P
 * @return {number} the integer value.
 */
 function constToNum(str, linenum = -1) {
    let info = /(?<hex>x"(?<hexval>[0-9A-F]*)")|(?<bin>"(?<binval>[01]*)")|(?<dec>\d*)/.exec(str).groups;
    let parsed = NaN;
    if (info.hex) parsed = parseInt(info.hexval, 16);
    if (info.bin) parsed = parseInt(info.binval,  2);
    if (info.dec) parsed = parseInt(str, 10);
    if (isNaN(parsed)) throw {
        title: 'Parse Error', 
        message: `Parse Error on line <b>${linenum}</b>: Constant ${str} is not a valid constant!`
    };
    return parsed;
}

/**
 * Converts a (negative) number to binary 2s complement of fixed length
 * @param {number} num - the number to convert.
 * @param {number} length - length of the binary string.
 * @return {string} the binary string
 */
function numToBin(num, length) {
    let str = (num & ((2**length)-1)).toString(2);
    while(str.length < length) {str = '0' + str};
    return str;
}

/**
 * Converts a (negative) number to hexadecimal 2s complement of fixed length
 * @param {number} num - the number to convert.
 * @param {number} length - length of the binary string.
 * @return {string} the hexadecimal string
 */
function numToHex(num, length) {
    let str = (num & ((16**length)-1)).toString(16);
    while(str.length < length) {str = '0' + str};
    return str.toUpperCase();
}

/**
 * Just for the comfort of the user.
 * (IS THIS PROGRAM EVEN DOING ANYTHING?)
 * @param {number} ms - Millis to sleep.
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

//==========================================\\
//                ASSEMBLER                 \\
//==========================================\\

/**
 * Assemble the input string from assemblyhal into address-value file (.bin)
 * @param {string} input - The assembly code to assemble. As filestring.
 * @param {number} startAddress - Startaddress to go from (decimal)
 * @param {function} percentDone - Function to call with percentage done.
 * @param {function} warning - Function to call with warnings.
 * @return {string} - The assembled program in form of hex address -> value.
 */
async function assemble(input, startAddress = 0, percentDone = ()=>{}, warning = ()=>{}) {
    // Get the input and start progress.
    console.log('Assembler started!');
    percentDone(1);
    await sleep(300); // Dont judge. This makes the program feel more natural.
    console.log('Step 1: load the preamble and get rid of other comments.');
    // This allows us to inject some instructions more easily.
    let preamble = input.match(regexPreamble);
    if (preamble && preamble.length > 0) preamble = preamble[0];
    if (!preamble) preamble = "# User Program";
    console.log('Preamble: \n' + preamble);
    // input = input.replace(regexEmptyOrComment, ''); // Cut line comments and empty lines
    input = input.replace(regexComment, ''); // Cut remaining comments
    console.log('Step 2: First pass. Split addresses & Find labels.');
    // In this pass we run through the program and replace all pseudo
    // assembly instructions.
    // Replace long address in ST, LD and B[A|ZERO|NEG] with 3 instructions
    // using the assembler register. Note that implementation differs for debug mode.
    let lines = input.split('\n');
    let matches = [];
    // To find addresses for labels & store assembler vars. Keep track of instructions and addresses.
    let assVars = new Map(preVars);
    let iCnt = 0; // Instruction counter.
    for (let i = 0; i < lines.length; i++) {
        let l = masterRegex.exec(lines[i]).groups;
        matches.push(l); // For further use.
        // If we encounter constant assignment:
        if (l.cAssign) assVars.set(l.address, constToNum(l.C, i+1));
        // To find address, just store the instruction counter x2 (word aligned) to name of label if found.
        if (l.label) assVars.set(l.lLabel, startAddress + (iCnt * 2));
        if (l.instruction) {
            // If there is an address specified without hi/lo selector. Always update (except for PUT and constant assignments).
            if (l.instruction !== "PUT" && l.address && !l.aHiLo) {
                lines[i] = `${l.label || ''} SETHI $rA, ${l.address}> && SETLO $rA, ${l.address}< && ${l.instruction}${(l.Rd ? ` ${l.Rd},` : '')} $rA`;
                iCnt += 2; // We will add 2 extra instructions.
            }
            // On display constant instructions we have 2 constants. We cannot have that next run :P
            // Solution: Comebine them into 1 10 bit constant.
            if (l.instruction === "DISPCL" || l.instruction === "DISPCM" || l.instruction === "DISPCR") {
                if (!l.C) throw {
                    title: "Pre-Parse Error", 
                    message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing display constant!`
                };
                let C12 = regex2Constant.exec(lines[i]).groups;
                warning( {message: lines[i]});
                if (!C12.C2) throw {
                    title: "Pre-Parse Error", 
                    message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing second display constant!`
                };
                let c1 = constToNum(C12.C1, i+1);
                if (c1 < -16 || c1 > 31) throw {
                    title: "Constant Error", 
                    message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant (1): ${l.C} only -16 to 31 is allowed! Try checking your display constants.`
                };
                let c2 = constToNum(C12.C2, i+1);
                if (c2 < -16 || c2 > 31) throw {
                    title: "Constant Error", 
                    message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant (2): ${l.C} only -16 to 31 is allowed! Try checking your display constants.`
                };
                let correctedC = `${(c1 & 31) << 5 | (c2 & 31)}`;
                lines[i] = `${l.label || ''} ${l.instruction} ${correctedC}`;
            }
            iCnt++; // Raise instruction counter.
        }
        percentDone((25/lines.length) * i);
    }
    console.log("First disection:");
    console.dir(matches);
    console.log("After first pass:");
    console.dir(lines);
    console.log("Assembler Vars:");
    console.dir(assVars);
    await sleep(200 + Math.random()*300); // Dont judge. This makes the program feel more natural.

    console.log("Step 3: Second Pass; replace the addresses with corresponding values. Decimalise the constants.");
    for (let i = 0; i < lines.length; i++) {
        let l = matches[i];
        // Replace all constants with decimals (makes stuff easier next run)
        // Not replace on display because we already did that :P
        if (l.C && !instDisp[l.instruction]) {
            let num = constToNum(l.C, i+1);
            lines[i] = `${l.label || ''} ${l.instruction || ''} ${(l.Rd ? ` ${l.Rd},` : '')} ${num}`;
            if (l.cAssign) lines[i] = ''; // Remove assignments. No longer useful.
        }
        // Replace all address values with constant decimals.
        lines[i] = lines[i].replace(regexAddress, (match, address, aLabel, aVar, aHiLo) => {
            aVar = aVar || '';
            let val = assVars.get(`${aVar}${aLabel}${aVar}`);
            console.log(`getting: ${aVar}${aLabel}${aVar} = ${val} (${val >>> 8} - ${val & 255})`);
            if (val == undefined ||  val == null) throw {
                title: 'Var Error',
                message: `Variable Error on line <b>${i+1}</b>: Address ${aLabel} is undefined!`
            };
            switch (aHiLo) {
                case ">": return val >>> 8; // Logical right shift because we only have 16 bits.
                case "<": return val & 255; // Only get the lowest 8 bits.
                default: return val;
            }
        });
        percentDone(25 + (25/lines.length) * i);
    }
    console.log("After second pass:");
    console.dir(lines);
    await sleep(200 + Math.random()*300);
    console.log("Step 4: Third pass. Convert to assembly instructions.");
    let data = []; let dataComment = [];
    for (let i = 0; i < lines.length; i++) {
        let sublines = lines[i].split("&&");
        for (let j = 0; j < sublines.length; j++) {
            let l = masterRegex.exec(sublines[j]).groups;
            // Only encode if there is instruction :P
            if (l.instruction) {
                dataComment.push(` # ${l.instruction}${l.Rd ? ` ${l.Rd},` : ''} ${l.Rs || ''}${l.C != undefined ? `x"${parseInt(l.C).toString(16)}"` : ''}`);
                // Perform checks to find instruction type.
                let nameData = null;
                // PUT
                if (l.instruction == "PUT") {
                    // Check constant
                    if (!l.C) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing constant!`
                    };
                    if (l.C < -32768 || l.C > 65535) throw {
                        title: "Constant Error", 
                        message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant: ${l.C} only -32768 to 65535 is allowed!`
                    };
                    data.push(numToBin(l.C, 16)); continue; // Push full constant to 16 bits.
                }
                // ARITHMETIC
                nameData = instArithmetic[l.instruction];
                if (nameData) {
                    // We always have an $Rd register.
                    if (!l.Rd) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b>. Missing Rd register!`
                    };
                    // Either we also have a $Rs register or we have a constant or neither.
                    if (l.Rs) {
                        data.push(`000${registers[l.RdN]}${nameData}0${registers[l.RsN]}`); continue;
                    } else if (l.C) {
                        // Check if constant is in range (5 bits signed max)
                        if (l.C < -16 || l.C > 31) throw {
                            title: "Constant Error", 
                            message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant: ${l.C} only -16 to 31 is allowed!`
                        };
                        data.push(`001${registers[l.RdN]}${nameData}${numToBin(l.C, 5)}`); continue;
                    } else {
                        // Only for random we can have neither.
                        if (l.instruction === "RAND") {
                            data.push(`000${registers[l.RdN]}${nameData}00000`); continue;
                        }
                        throw {
                            title: "Syntax Error", 
                            message: `Arithmatic operation on line <b>${i+1}</b> (${l.instruction}). Expects a register or constant!`
                        };
                    }
                }
                // MEMORY
                nameData = instMemory[l.instruction];
                if (nameData) {
                    // We always have an $Rd and $Rs register.
                    if (!l.Rd) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing $Rd register!`
                    };
                    if (!l.Rs) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing $Rs register!`
                    };
                    data.push(`010${registers[l.RdN]}${nameData}0000${registers[l.RsN]}`); continue;
                }
                // DISPLAY
                nameData = instDisp[l.instruction];
                if (nameData) {
                    //TODO HELP constant 2. Do into 10 bits Merge two constants previous pass

                    // In this case we only have $Rs but regex only sees the $Rd so ¯\_(ツ)_/¯
                    if (l.Rd) {
                        data.push(`100${nameData[0]}00${nameData[1]}0000${registers[l.RdN]}`); continue;
                    } else if (l.C) {
                        // Check range
                        if (l.C < -512 || l.C > 1023) throw {
                            title: "Constant Error", 
                            message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant: ${l.C} only -512 to 1023 is allowed! Try checking your display constants.`
                        };
                        data.push(`101${nameData[0]}0${numToBin(l.C, 10)}`); continue;
                    } else {
                        throw {
                            title: "Syntax Error", 
                            message: `Display operation on line <b>${i+1}</b> (${l.instruction}). Expects a value!`
                        };
                    }
                }
                // BRANCH
                nameData = instBranch[l.instruction];
                if (nameData) {
                    // In this case we only have $Rs but regex only sees the $Rd so ¯\_(ツ)_/¯
                    if (!l.Rd && l.instruction !== "RET") throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing $Rs register!`
                    };
                    let rdn = l.instruction == "RET" ? 'r0': l.RdN;
                    data.push(`1100000${nameData}0${registers[rdn]}`); continue;
                }
                // SET
                nameData = instSet[l.instruction];
                if (nameData) {
                    // We always have an $Rd and a constant
                    if (!l.Rd) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing $Rd register!`
                    };
                    if (!l.C) throw {
                        title: "Parse Error", 
                        message: `Parse Error on line <b>${i+1}</b> (${l.instruction}). Missing constant!`
                    };
                    // Check range
                    if (l.C < -128 || l.C > 255) throw {
                        title: "Constant Error", 
                        message: `Constant Error on line <b>${i+1}</b> (${l.instruction}). Out of range constant: ${l.C} only -128 to 255 is allowed!`
                    };
                    data.push(`111${registers[l.RdN]}${nameData}${numToBin(l.C, 8)}`); continue;
                }
                throw {
                    title: "Instruction Error", 
                    message: `Unknown instruction on line <b>${i+1}</b> (${l.instruction})!`
                };
            }
        }
        percentDone(50 + (25/lines.length) * i);
    }
    console.log("After third pass:");
    console.dir(data);
    console.log("Comments:");
    console.dir(dataComment);
    await sleep(200 + Math.random() * 300); // Dont judge. This makes the program feel more natural.
    console.log("Step 5: fourth pass. Split, convert to hex and add address + comments.");
    let memory = preamble.split('\n'); let address = startAddress;
    memory.push(`# Compiled on ${new Date().toUTCString()} by Hal8080 Assembler [k]`);
    memory.push("======="); // Split the preamble from the binary.
    for (let i = 0; i < data.length; i++) {
        // Memory is in Little Endian.
        let low = numToHex(parseInt(data[i], 2) >>> 8, 2); // Lowest 8 bits in memory 1
        let hi  = numToHex(parseInt(data[i], 2) & 255, 2); // Lowest 8 bits in memory 0
        memory.push(`${numToHex(address,   4)}-${ hi}${dataComment[i]}`);
        memory.push(`${numToHex(address+1, 4)}-${low}`);
        address += 2;
        percentDone(75 + (25/data.length) * i);
    }
    console.log("After fourth pass:");
    console.dir(memory);
    await sleep(200 + Math.random()*300); // Dont judge. This makes the program feel more natural.
    percentDone(100);
    // Return memory as big string for file.
    return memory.join('\n');
}