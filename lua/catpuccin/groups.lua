local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("catpuccin").config
  local colors = require("catpuccin.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    catpuccinFg0 = { fg = colors.fg0 },
    catpuccinFg1 = { fg = colors.fg1 },
    catpuccinFg2 = { fg = colors.fg2 },
    catpuccinFg3 = { fg = colors.fg3 },
    catpuccinFg4 = { fg = colors.fg4 },
    catpuccinGray = { fg = colors.gray },
    catpuccinBg0 = { fg = colors.bg0 },
    catpuccinBg1 = { fg = colors.bg1 },
    catpuccinBg2 = { fg = colors.bg2 },
    catpuccinBg3 = { fg = colors.bg3 },
    catpuccinBg4 = { fg = colors.bg4 },
    catpuccinRed = { fg = colors.red },
    catpuccinRedBold = { fg = colors.red, bold = config.bold },
    catpuccinGreen = { fg = colors.green },
    catpuccinGreenBold = { fg = colors.green, bold = config.bold },
    catpuccinYellow = { fg = colors.yellow },
    catpuccinYellowBold = { fg = colors.yellow, bold = config.bold },
    catpuccinBlue = { fg = colors.blue },
    catpuccinBlueBold = { fg = colors.blue, bold = config.bold },
    catpuccinPurple = { fg = colors.purple },
    catpuccinPurpleBold = { fg = colors.purple, bold = config.bold },
    catpuccinAqua = { fg = colors.aqua },
    catpuccinAquaBold = { fg = colors.aqua, bold = config.bold },
    catpuccinOrange = { fg = colors.orange },
    catpuccinOrangeBold = { fg = colors.orange, bold = config.bold },
    catpuccinRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    catpuccinRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    catpuccinGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    catpuccinYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    catpuccinBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    catpuccinPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    catpuccinAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    catpuccinOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "catpuccinBg2" },
    SpecialKey = { link = "catpuccinFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "catpuccinBlueBold" },
    Title = { link = "catpuccinGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "catpuccinYellowBold" },
    ModeMsg = { link = "catpuccinYellowBold" },
    Question = { link = "catpuccinOrangeBold" },
    WarningMsg = { link = "catpuccinRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "catpuccinOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "catpuccinRed" },
    Conditional = { link = "catpuccinRed" },
    Repeat = { link = "catpuccinRed" },
    Label = { link = "catpuccinRed" },
    Exception = { link = "catpuccinRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "catpuccinRed" },
    Identifier = { link = "catpuccinBlue" },
    Function = { link = "catpuccinGreenBold" },
    PreProc = { link = "catpuccinAqua" },
    Include = { link = "catpuccinAqua" },
    Define = { link = "catpuccinAqua" },
    Macro = { link = "catpuccinAqua" },
    PreCondit = { link = "catpuccinAqua" },
    Constant = { link = "catpuccinPurple" },
    Character = { link = "catpuccinPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "catpuccinPurple" },
    Number = { link = "catpuccinPurple" },
    Float = { link = "catpuccinPurple" },
    Type = { link = "catpuccinYellow" },
    StorageClass = { link = "catpuccinOrange" },
    Structure = { link = "catpuccinAqua" },
    Typedef = { link = "catpuccinYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "catpuccinBlueUnderline" },
    SpellBad = { link = "catpuccinRedUnderline" },
    SpellLocal = { link = "catpuccinAquaUnderline" },
    SpellRare = { link = "catpuccinPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "catpuccinRed" },
    DiagnosticSignError = { link = "catpuccinRedSign" },
    DiagnosticUnderlineError = { link = "catpuccinRedUnderline" },
    DiagnosticWarn = { link = "catpuccinYellow" },
    DiagnosticSignWarn = { link = "catpuccinYellowSign" },
    DiagnosticUnderlineWarn = { link = "catpuccinYellowUnderline" },
    DiagnosticInfo = { link = "catpuccinBlue" },
    DiagnosticSignInfo = { link = "catpuccinBlueSign" },
    DiagnosticUnderlineInfo = { link = "catpuccinBlueUnderline" },
    DiagnosticHint = { link = "catpuccinAqua" },
    DiagnosticSignHint = { link = "catpuccinAquaSign" },
    DiagnosticUnderlineHint = { link = "catpuccinAquaUnderline" },
    DiagnosticFloatingError = { link = "catpuccinRed" },
    DiagnosticFloatingWarn = { link = "catpuccinOrange" },
    DiagnosticFloatingInfo = { link = "catpuccinBlue" },
    DiagnosticFloatingHint = { link = "catpuccinAqua" },
    DiagnosticVirtualTextError = { link = "catpuccinRed" },
    DiagnosticVirtualTextWarn = { link = "catpuccinYellow" },
    DiagnosticVirtualTextInfo = { link = "catpuccinBlue" },
    DiagnosticVirtualTextHint = { link = "catpuccinAqua" },
    LspReferenceRead = { link = "catpuccinYellowBold" },
    LspReferenceText = { link = "catpuccinYellowBold" },
    LspReferenceWrite = { link = "catpuccinOrangeBold" },
    LspCodeLens = { link = "catpuccinGray" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "catpuccinRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "catpuccinFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "catpuccinFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "catpuccinFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "catpuccinGreen" },
    gitcommitDiscardedFile = { link = "catpuccinRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "catpuccinGreenSign" },
    GitSignsChange = { link = "catpuccinAquaSign" },
    GitSignsDelete = { link = "catpuccinRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "catpuccinRedSign" },
    -- vim-startify
    StartifyBracket = { link = "catpuccinFg3" },
    StartifyFile = { link = "catpuccinFg1" },
    StartifyNumber = { link = "catpuccinBlue" },
    StartifyPath = { link = "catpuccinGray" },
    StartifySlash = { link = "catpuccinGray" },
    StartifySection = { link = "catpuccinYellow" },
    StartifySpecial = { link = "catpuccinBg2" },
    StartifyHeader = { link = "catpuccinOrange" },
    StartifyFooter = { link = "catpuccinBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "catpuccinAqua" },
    DirvishArg = { link = "catpuccinYellow" },
    -- netrw
    netrwDir = { link = "catpuccinAqua" },
    netrwClassify = { link = "catpuccinAqua" },
    netrwLink = { link = "catpuccinGray" },
    netrwSymLink = { link = "catpuccinFg1" },
    netrwExe = { link = "catpuccinYellow" },
    netrwComment = { link = "catpuccinGray" },
    netrwList = { link = "catpuccinBlue" },
    netrwHelpCmd = { link = "catpuccinAqua" },
    netrwCmdSep = { link = "catpuccinFg3" },
    netrwVersion = { link = "catpuccinGreen" },
    -- nerdtree
    NERDTreeDir = { link = "catpuccinAqua" },
    NERDTreeDirSlash = { link = "catpuccinAqua" },
    NERDTreeOpenable = { link = "catpuccinOrange" },
    NERDTreeClosable = { link = "catpuccinOrange" },
    NERDTreeFile = { link = "catpuccinFg1" },
    NERDTreeExecFile = { link = "catpuccinYellow" },
    NERDTreeUp = { link = "catpuccinGray" },
    NERDTreeCWD = { link = "catpuccinGreen" },
    NERDTreeHelp = { link = "catpuccinFg1" },
    NERDTreeToggleOn = { link = "catpuccinGreen" },
    NERDTreeToggleOff = { link = "catpuccinRed" },
    -- coc.nvim
    CocErrorSign = { link = "catpuccinRedSign" },
    CocWarningSign = { link = "catpuccinOrangeSign" },
    CocInfoSign = { link = "catpuccinBlueSign" },
    CocHintSign = { link = "catpuccinAquaSign" },
    CocErrorFloat = { link = "catpuccinRed" },
    CocWarningFloat = { link = "catpuccinOrange" },
    CocInfoFloat = { link = "catpuccinBlue" },
    CocHintFloat = { link = "catpuccinAqua" },
    CocDiagnosticsError = { link = "catpuccinRed" },
    CocDiagnosticsWarning = { link = "catpuccinOrange" },
    CocDiagnosticsInfo = { link = "catpuccinBlue" },
    CocDiagnosticsHint = { link = "catpuccinAqua" },
    CocSelectedText = { link = "catpuccinRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "catpuccinGray" },
    CocErrorHighlight = { link = "catpuccinRedUnderline" },
    CocWarningHighlight = { link = "catpuccinOrangeUnderline" },
    CocInfoHighlight = { link = "catpuccinBlueUnderline" },
    CocHintHighlight = { link = "catpuccinAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "catpuccinFg1" },
    TelescopeSelection = { link = "catpuccinOrangeBold" },
    TelescopeSelectionCaret = { link = "catpuccinRed" },
    TelescopeMultiSelection = { link = "catpuccinGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "catpuccinBlue" },
    TelescopePromptPrefix = { link = "catpuccinRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "catpuccinFg0" },
    CmpItemAbbrDeprecated = { link = "catpuccinFg1" },
    CmpItemAbbrMatch = { link = "catpuccinBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "catpuccinBlueUnderline" },
    CmpItemMenu = { link = "catpuccinGray" },
    CmpItemKindText = { link = "catpuccinOrange" },
    CmpItemKindVariable = { link = "catpuccinOrange" },
    CmpItemKindMethod = { link = "catpuccinBlue" },
    CmpItemKindFunction = { link = "catpuccinBlue" },
    CmpItemKindConstructor = { link = "catpuccinYellow" },
    CmpItemKindUnit = { link = "catpuccinBlue" },
    CmpItemKindField = { link = "catpuccinBlue" },
    CmpItemKindClass = { link = "catpuccinYellow" },
    CmpItemKindInterface = { link = "catpuccinYellow" },
    CmpItemKindModule = { link = "catpuccinBlue" },
    CmpItemKindProperty = { link = "catpuccinBlue" },
    CmpItemKindValue = { link = "catpuccinOrange" },
    CmpItemKindEnum = { link = "catpuccinYellow" },
    CmpItemKindOperator = { link = "catpuccinYellow" },
    CmpItemKindKeyword = { link = "catpuccinPurple" },
    CmpItemKindEvent = { link = "catpuccinPurple" },
    CmpItemKindReference = { link = "catpuccinPurple" },
    CmpItemKindColor = { link = "catpuccinPurple" },
    CmpItemKindSnippet = { link = "catpuccinGreen" },
    CmpItemKindFile = { link = "catpuccinBlue" },
    CmpItemKindFolder = { link = "catpuccinBlue" },
    CmpItemKindEnumMember = { link = "catpuccinAqua" },
    CmpItemKindConstant = { link = "catpuccinOrange" },
    CmpItemKindStruct = { link = "catpuccinYellow" },
    CmpItemKindTypeParameter = { link = "catpuccinYellow" },
    diffAdded = { link = "catpuccinGreen" },
    diffRemoved = { link = "catpuccinRed" },
    diffChanged = { link = "catpuccinAqua" },
    diffFile = { link = "catpuccinOrange" },
    diffNewFile = { link = "catpuccinYellow" },
    diffOldFile = { link = "catpuccinOrange" },
    diffLine = { link = "catpuccinBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "catpuccinBlue" },
    NavicIconsModule = { link = "catpuccinOrange" },
    NavicIconsNamespace = { link = "catpuccinBlue" },
    NavicIconsPackage = { link = "catpuccinAqua" },
    NavicIconsClass = { link = "catpuccinYellow" },
    NavicIconsMethod = { link = "catpuccinBlue" },
    NavicIconsProperty = { link = "catpuccinAqua" },
    NavicIconsField = { link = "catpuccinPurple" },
    NavicIconsConstructor = { link = "catpuccinBlue" },
    NavicIconsEnum = { link = "catpuccinPurple" },
    NavicIconsInterface = { link = "catpuccinGreen" },
    NavicIconsFunction = { link = "catpuccinBlue" },
    NavicIconsVariable = { link = "catpuccinPurple" },
    NavicIconsConstant = { link = "catpuccinOrange" },
    NavicIconsString = { link = "catpuccinGreen" },
    NavicIconsNumber = { link = "catpuccinOrange" },
    NavicIconsBoolean = { link = "catpuccinOrange" },
    NavicIconsArray = { link = "catpuccinOrange" },
    NavicIconsObject = { link = "catpuccinOrange" },
    NavicIconsKey = { link = "catpuccinAqua" },
    NavicIconsNull = { link = "catpuccinOrange" },
    NavicIconsEnumMember = { link = "catpuccinYellow" },
    NavicIconsStruct = { link = "catpuccinPurple" },
    NavicIconsEvent = { link = "catpuccinYellow" },
    NavicIconsOperator = { link = "catpuccinRed" },
    NavicIconsTypeParameter = { link = "catpuccinRed" },
    NavicText = { link = "catpuccinWhite" },
    NavicSeparator = { link = "catpuccinWhite" },
    -- html
    htmlTag = { link = "catpuccinAquaBold" },
    htmlEndTag = { link = "catpuccinAquaBold" },
    htmlTagName = { link = "catpuccinBlue" },
    htmlArg = { link = "catpuccinOrange" },
    htmlTagN = { link = "catpuccinFg1" },
    htmlSpecialTagName = { link = "catpuccinBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "catpuccinRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "catpuccinAquaBold" },
    xmlEndTag = { link = "catpuccinAquaBold" },
    xmlTagName = { link = "catpuccinBlue" },
    xmlEqual = { link = "catpuccinBlue" },
    docbkKeyword = { link = "catpuccinAquaBold" },
    xmlDocTypeDecl = { link = "catpuccinGray" },
    xmlDocTypeKeyword = { link = "catpuccinPurple" },
    xmlCdataStart = { link = "catpuccinGray" },
    xmlCdataCdata = { link = "catpuccinPurple" },
    dtdFunction = { link = "catpuccinGray" },
    dtdTagName = { link = "catpuccinPurple" },
    xmlAttrib = { link = "catpuccinOrange" },
    xmlProcessingDelim = { link = "catpuccinGray" },
    dtdParamEntityPunct = { link = "catpuccinGray" },
    dtdParamEntityDPunct = { link = "catpuccinGray" },
    xmlAttribPunct = { link = "catpuccinGray" },
    xmlEntity = { link = "catpuccinRed" },
    xmlEntityPunct = { link = "catpuccinRed" },
    -- clojure
    clojureKeyword = { link = "catpuccinBlue" },
    clojureCond = { link = "catpuccinOrange" },
    clojureSpecial = { link = "catpuccinOrange" },
    clojureDefine = { link = "catpuccinOrange" },
    clojureFunc = { link = "catpuccinYellow" },
    clojureRepeat = { link = "catpuccinYellow" },
    clojureCharacter = { link = "catpuccinAqua" },
    clojureStringEscape = { link = "catpuccinAqua" },
    clojureException = { link = "catpuccinRed" },
    clojureRegexp = { link = "catpuccinAqua" },
    clojureRegexpEscape = { link = "catpuccinAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "catpuccinFg3" },
    clojureAnonArg = { link = "catpuccinYellow" },
    clojureVariable = { link = "catpuccinBlue" },
    clojureMacro = { link = "catpuccinOrange" },
    clojureMeta = { link = "catpuccinYellow" },
    clojureDeref = { link = "catpuccinYellow" },
    clojureQuote = { link = "catpuccinYellow" },
    clojureUnquote = { link = "catpuccinYellow" },
    -- C
    cOperator = { link = "catpuccinPurple" },
    cppOperator = { link = "catpuccinPurple" },
    cStructure = { link = "catpuccinOrange" },
    -- python
    pythonBuiltin = { link = "catpuccinOrange" },
    pythonBuiltinObj = { link = "catpuccinOrange" },
    pythonBuiltinFunc = { link = "catpuccinOrange" },
    pythonFunction = { link = "catpuccinAqua" },
    pythonDecorator = { link = "catpuccinRed" },
    pythonInclude = { link = "catpuccinBlue" },
    pythonImport = { link = "catpuccinBlue" },
    pythonRun = { link = "catpuccinBlue" },
    pythonCoding = { link = "catpuccinBlue" },
    pythonOperator = { link = "catpuccinRed" },
    pythonException = { link = "catpuccinRed" },
    pythonExceptions = { link = "catpuccinPurple" },
    pythonBoolean = { link = "catpuccinPurple" },
    pythonDot = { link = "catpuccinFg3" },
    pythonConditional = { link = "catpuccinRed" },
    pythonRepeat = { link = "catpuccinRed" },
    pythonDottedName = { link = "catpuccinGreenBold" },
    -- CSS
    cssBraces = { link = "catpuccinBlue" },
    cssFunctionName = { link = "catpuccinYellow" },
    cssIdentifier = { link = "catpuccinOrange" },
    cssClassName = { link = "catpuccinGreen" },
    cssColor = { link = "catpuccinBlue" },
    cssSelectorOp = { link = "catpuccinBlue" },
    cssSelectorOp2 = { link = "catpuccinBlue" },
    cssImportant = { link = "catpuccinGreen" },
    cssVendor = { link = "catpuccinFg1" },
    cssTextProp = { link = "catpuccinAqua" },
    cssAnimationProp = { link = "catpuccinAqua" },
    cssUIProp = { link = "catpuccinYellow" },
    cssTransformProp = { link = "catpuccinAqua" },
    cssTransitionProp = { link = "catpuccinAqua" },
    cssPrintProp = { link = "catpuccinAqua" },
    cssPositioningProp = { link = "catpuccinYellow" },
    cssBoxProp = { link = "catpuccinAqua" },
    cssFontDescriptorProp = { link = "catpuccinAqua" },
    cssFlexibleBoxProp = { link = "catpuccinAqua" },
    cssBorderOutlineProp = { link = "catpuccinAqua" },
    cssBackgroundProp = { link = "catpuccinAqua" },
    cssMarginProp = { link = "catpuccinAqua" },
    cssListProp = { link = "catpuccinAqua" },
    cssTableProp = { link = "catpuccinAqua" },
    cssFontProp = { link = "catpuccinAqua" },
    cssPaddingProp = { link = "catpuccinAqua" },
    cssDimensionProp = { link = "catpuccinAqua" },
    cssRenderProp = { link = "catpuccinAqua" },
    cssColorProp = { link = "catpuccinAqua" },
    cssGeneratedContentProp = { link = "catpuccinAqua" },
    -- javascript
    javaScriptBraces = { link = "catpuccinFg1" },
    javaScriptFunction = { link = "catpuccinAqua" },
    javaScriptIdentifier = { link = "catpuccinRed" },
    javaScriptMember = { link = "catpuccinBlue" },
    javaScriptNumber = { link = "catpuccinPurple" },
    javaScriptNull = { link = "catpuccinPurple" },
    javaScriptParens = { link = "catpuccinFg3" },
    -- typescript
    typescriptReserved = { link = "catpuccinAqua" },
    typescriptLabel = { link = "catpuccinAqua" },
    typescriptFuncKeyword = { link = "catpuccinAqua" },
    typescriptIdentifier = { link = "catpuccinOrange" },
    typescriptBraces = { link = "catpuccinFg1" },
    typescriptEndColons = { link = "catpuccinFg1" },
    typescriptDOMObjects = { link = "catpuccinFg1" },
    typescriptAjaxMethods = { link = "catpuccinFg1" },
    typescriptLogicSymbols = { link = "catpuccinFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "catpuccinFg1" },
    typescriptParens = { link = "catpuccinFg3" },
    typescriptOpSymbols = { link = "catpuccinFg3" },
    typescriptHtmlElemProperties = { link = "catpuccinFg1" },
    typescriptNull = { link = "catpuccinPurple" },
    typescriptInterpolationDelimiter = { link = "catpuccinAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "catpuccinAqua" },
    purescriptModuleName = { link = "catpuccinFg1" },
    purescriptWhere = { link = "catpuccinAqua" },
    purescriptDelimiter = { link = "catpuccinFg4" },
    purescriptType = { link = "catpuccinFg1" },
    purescriptImportKeyword = { link = "catpuccinAqua" },
    purescriptHidingKeyword = { link = "catpuccinAqua" },
    purescriptAsKeyword = { link = "catpuccinAqua" },
    purescriptStructure = { link = "catpuccinAqua" },
    purescriptOperator = { link = "catpuccinBlue" },
    purescriptTypeVar = { link = "catpuccinFg1" },
    purescriptConstructor = { link = "catpuccinFg1" },
    purescriptFunction = { link = "catpuccinFg1" },
    purescriptConditional = { link = "catpuccinOrange" },
    purescriptBacktick = { link = "catpuccinOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "catpuccinFg3" },
    coffeeSpecialOp = { link = "catpuccinFg3" },
    coffeeCurly = { link = "catpuccinOrange" },
    coffeeParen = { link = "catpuccinFg3" },
    coffeeBracket = { link = "catpuccinOrange" },
    -- ruby
    rubyStringDelimiter = { link = "catpuccinGreen" },
    rubyInterpolationDelimiter = { link = "catpuccinAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "catpuccinRed" },
    objcDirective = { link = "catpuccinBlue" },
    -- go
    goDirective = { link = "catpuccinAqua" },
    goConstants = { link = "catpuccinPurple" },
    goDeclaration = { link = "catpuccinRed" },
    goDeclType = { link = "catpuccinBlue" },
    goBuiltins = { link = "catpuccinOrange" },
    -- lua
    luaIn = { link = "catpuccinRed" },
    luaFunction = { link = "catpuccinAqua" },
    luaTable = { link = "catpuccinOrange" },
    -- moonscript
    moonSpecialOp = { link = "catpuccinFg3" },
    moonExtendedOp = { link = "catpuccinFg3" },
    moonFunction = { link = "catpuccinFg3" },
    moonObject = { link = "catpuccinYellow" },
    -- java
    javaAnnotation = { link = "catpuccinBlue" },
    javaDocTags = { link = "catpuccinAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "catpuccinFg3" },
    javaParen1 = { link = "catpuccinFg3" },
    javaParen2 = { link = "catpuccinFg3" },
    javaParen3 = { link = "catpuccinFg3" },
    javaParen4 = { link = "catpuccinFg3" },
    javaParen5 = { link = "catpuccinFg3" },
    javaOperator = { link = "catpuccinOrange" },
    javaVarArg = { link = "catpuccinGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "catpuccinGreen" },
    elixirInterpolationDelimiter = { link = "catpuccinAqua" },
    elixirModuleDeclaration = { link = "catpuccinYellow" },
    -- scala
    scalaNameDefinition = { link = "catpuccinFg1" },
    scalaCaseFollowing = { link = "catpuccinFg1" },
    scalaCapitalWord = { link = "catpuccinFg1" },
    scalaTypeExtension = { link = "catpuccinFg1" },
    scalaKeyword = { link = "catpuccinRed" },
    scalaKeywordModifier = { link = "catpuccinRed" },
    scalaSpecial = { link = "catpuccinAqua" },
    scalaOperator = { link = "catpuccinFg1" },
    scalaTypeDeclaration = { link = "catpuccinYellow" },
    scalaTypeTypePostDeclaration = { link = "catpuccinYellow" },
    scalaInstanceDeclaration = { link = "catpuccinFg1" },
    scalaInterpolation = { link = "catpuccinAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "catpuccinGreenBold" },
    markdownH2 = { link = "catpuccinGreenBold" },
    markdownH3 = { link = "catpuccinYellowBold" },
    markdownH4 = { link = "catpuccinYellowBold" },
    markdownH5 = { link = "catpuccinYellow" },
    markdownH6 = { link = "catpuccinYellow" },
    markdownCode = { link = "catpuccinAqua" },
    markdownCodeBlock = { link = "catpuccinAqua" },
    markdownCodeDelimiter = { link = "catpuccinAqua" },
    markdownBlockquote = { link = "catpuccinGray" },
    markdownListMarker = { link = "catpuccinGray" },
    markdownOrderedListMarker = { link = "catpuccinGray" },
    markdownRule = { link = "catpuccinGray" },
    markdownHeadingRule = { link = "catpuccinGray" },
    markdownUrlDelimiter = { link = "catpuccinFg3" },
    markdownLinkDelimiter = { link = "catpuccinFg3" },
    markdownLinkTextDelimiter = { link = "catpuccinFg3" },
    markdownHeadingDelimiter = { link = "catpuccinOrange" },
    markdownUrl = { link = "catpuccinPurple" },
    markdownUrlTitleDelimiter = { link = "catpuccinGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "catpuccinBlue" },
    haskellIdentifier = { link = "catpuccinAqua" },
    haskellSeparator = { link = "catpuccinFg4" },
    haskellDelimiter = { link = "catpuccinOrange" },
    haskellOperators = { link = "catpuccinPurple" },
    haskellBacktick = { link = "catpuccinOrange" },
    haskellStatement = { link = "catpuccinPurple" },
    haskellConditional = { link = "catpuccinPurple" },
    haskellLet = { link = "catpuccinRed" },
    haskellDefault = { link = "catpuccinRed" },
    haskellWhere = { link = "catpuccinRed" },
    haskellBottom = { link = "catpuccinRedBold" },
    haskellImportKeywords = { link = "catpuccinPurpleBold" },
    haskellDeclKeyword = { link = "catpuccinOrange" },
    haskellDecl = { link = "catpuccinOrange" },
    haskellDeriving = { link = "catpuccinPurple" },
    haskellAssocType = { link = "catpuccinAqua" },
    haskellNumber = { link = "catpuccinAqua" },
    haskellPragma = { link = "catpuccinRedBold" },
    haskellTH = { link = "catpuccinAquaBold" },
    haskellForeignKeywords = { link = "catpuccinGreen" },
    haskellKeyword = { link = "catpuccinRed" },
    haskellFloat = { link = "catpuccinAqua" },
    haskellInfix = { link = "catpuccinPurple" },
    haskellQuote = { link = "catpuccinGreenBold" },
    haskellShebang = { link = "catpuccinYellowBold" },
    haskellLiquid = { link = "catpuccinPurpleBold" },
    haskellQuasiQuoted = { link = "catpuccinBlueBold" },
    haskellRecursiveDo = { link = "catpuccinPurple" },
    haskellQuotedType = { link = "catpuccinRed" },
    haskellPreProc = { link = "catpuccinFg4" },
    haskellTypeRoles = { link = "catpuccinRedBold" },
    haskellTypeForall = { link = "catpuccinRed" },
    haskellPatternKeyword = { link = "catpuccinBlue" },
    -- json
    jsonKeyword = { link = "catpuccinGreen" },
    jsonQuote = { link = "catpuccinGreen" },
    jsonBraces = { link = "catpuccinFg1" },
    jsonString = { link = "catpuccinFg1" },
    -- mail
    mailQuoted1 = { link = "catpuccinAqua" },
    mailQuoted2 = { link = "catpuccinPurple" },
    mailQuoted3 = { link = "catpuccinYellow" },
    mailQuoted4 = { link = "catpuccinGreen" },
    mailQuoted5 = { link = "catpuccinRed" },
    mailQuoted6 = { link = "catpuccinOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "catpuccinFg1" },
    csEndColon = { link = "catpuccinFg1" },
    csLogicSymbols = { link = "catpuccinFg1" },
    csParens = { link = "catpuccinFg3" },
    csOpSymbols = { link = "catpuccinFg3" },
    csInterpolationDelimiter = { link = "catpuccinFg3" },
    csInterpolationAlignDel = { link = "catpuccinAquaBold" },
    csInterpolationFormat = { link = "catpuccinAqua" },
    csInterpolationFormatDel = { link = "catpuccinAquaBold" },
    -- rust btw
    rustSigil = { link = "catpuccinOrange" },
    rustEscape = { link = "catpuccinAqua" },
    rustStringContinuation = { link = "catpuccinAqua" },
    rustEnum = { link = "catpuccinAqua" },
    rustStructure = { link = "catpuccinAqua" },
    rustModPathSep = { link = "catpuccinFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "catpuccinAqua" },
    -- ocaml
    ocamlOperator = { link = "catpuccinFg1" },
    ocamlKeyChar = { link = "catpuccinOrange" },
    ocamlArrow = { link = "catpuccinOrange" },
    ocamlInfixOpKeyword = { link = "catpuccinRed" },
    ocamlConstructor = { link = "catpuccinOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "catpuccinFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "catpuccinFg1" },
    LspSagaAutoPreview = { link = "catpuccinOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "catpuccinAqua" },
    LspSagaDefPreviewBorder = { link = "catpuccinBlue" },
    LspSagaHoverBorder = { link = "catpuccinOrange" },
    LspSagaRenameBorder = { link = "catpuccinBlue" },
    LspSagaDiagnosticSource = { link = "catpuccinOrange" },
    LspSagaDiagnosticBorder = { link = "catpuccinPurple" },
    LspSagaDiagnosticHeader = { link = "catpuccinGreen" },
    LspSagaSignatureHelpBorder = { link = "catpuccinGreen" },
    SagaShadow = { link = "catpuccinBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "catpuccinOrange" },
    DashboardHeader = { link = "catpuccinAqua" },
    DashboardCenter = { link = "catpuccinYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "catpuccinAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "catpuccinFg1" },
    CarbonExe = { link = "catpuccinYellow" },
    CarbonSymlink = { link = "catpuccinAqua" },
    CarbonBrokenSymlink = { link = "catpuccinRed" },
    CarbonIndicator = { link = "catpuccinGray" },
    CarbonDanger = { link = "catpuccinRed" },
    CarbonPending = { link = "catpuccinYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "catpuccinBlue" },
    NotifyDEBUGIcon = { link = "catpuccinBlue" },
    NotifyDEBUGTitle = { link = "catpuccinBlue" },
    NotifyERRORBorder = { link = "catpuccinRed" },
    NotifyERRORIcon = { link = "catpuccinRed" },
    NotifyERRORTitle = { link = "catpuccinRed" },
    NotifyINFOBorder = { link = "catpuccinAqua" },
    NotifyINFOIcon = { link = "catpuccinAqua" },
    NotifyINFOTitle = { link = "catpuccinAqua" },
    NotifyTRACEBorder = { link = "catpuccinGreen" },
    NotifyTRACEIcon = { link = "catpuccinGreen" },
    NotifyTRACETitle = { link = "catpuccinGreen" },
    NotifyWARNBorder = { link = "catpuccinYellow" },
    NotifyWARNIcon = { link = "catpuccinYellow" },
    NotifyWARNTitle = { link = "catpuccinYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
