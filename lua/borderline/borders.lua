local M = {
  ---@type nil
  undefined       = nil,
  ---@type table
  -- no border
  none            = { '', '', '', '', '', '', '', '' },
  ---@type table
  -- ╔═══╗
  -- ║   ║
  -- ╚═══╝
  double          = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' },
  ---@type table
  -- ┌───┐
  -- │   │
  -- └───┘
  single          = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
  ---@type table
  -- ```
  --     ░  where ░ is ' ' with highlight 'FloatShadowThrough'
  --     ▒    and ▒ is ' ' with highlight 'FloatShadow'
  -- ░▒▒▒▒
  -- ```
  shadow          = { '', '', { ' ', 'FloatShadowThrough' }, { ' ', 'FloatShadow' }, { ' ', 'FloatShadow' },
    { ' ', 'FloatShadow' }, { ' ', 'FloatShadowThrough' }, '' },
  ---@type table
  -- ╭───╮
  -- │   │
  -- ╰───╯
  rounded         =
  { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  ---@type table
  -- █████ where █ is ' '
  -- █   █
  -- █████
  solid           = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  ---@type table
  -- ▛▀▀▀▜
  -- ▌   ▐
  -- ▙▄▄▄▟
  -- ---
  -- nui refers to block as solid
  block           = { '▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' },
  ---@type table
  -- ▄▄▄
  -- ▌ ▐
  -- ▀▀▀
  inner_block     = { ' ', '▄', ' ', '▌', ' ', '▀', ' ', '▐' },
  ---@type table
  -- 🭽▔▔▔🭾
  -- ▏   ▕
  -- 🭼▁▁▁🭿
  thinblock       = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
  ---@type table
  --  ▁▁▁
  -- ▕   ▏
  --  ▔▔▔
  inner_thinblock = { ' ', '▁', ' ', '▏', ' ', '▔', ' ', '▕' },
  ---@type table
  -- •••••
  -- •   •
  -- •••••
  bullet          = { '•', '•', '•', '•', '•', '•', '•', '•' },
  ---@type table
  -- ```
  -- *****
  -- *   *
  -- *****
  -- ```
  star            = { '*', '*', '*', '*', '*', '*', '*', '*' },
  ---@type table
  -- ```
  -- +---+
  -- |   |
  -- +---+
  -- ```
  simple          = { '+', '-', '+', '|', '+', '-', '+', '|' },
  ---@type table
  -- ┏━━━┓
  -- ┃   ┃
  -- ┗━━━┛
  heavy_single    = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
  ---@type table
  -- ░░░░░
  -- ░   ░
  -- ░░░░░
  light_shade     = { '░', '░', '░', '░', '░', '░', '░', '░' },
  ---@type table
  -- ▒▒▒▒▒
  -- ▒   ▒
  -- ▒▒▒▒▒
  medium_shade    = { '▒', '▒', '▒', '▒', '▒', '▒', '▒', '▒' },
  ---@type table
  -- ▓▓▓▓▓
  -- ▓   ▓
  -- ▓▓▓▓▓
  dark_shade      = { '▓', '▓', '▓', '▓', '▓', '▓', '▓', '▓' },
  ---@type table
  -- ↗→→→↘
  -- ↓   ↑
  -- ↖←←←↙
  arrow           = { '↗', '→', '↘', '↓', '↙', '←', '↖', '↑' },
  ---@type table
  -- █████
  -- █   █
  -- █████
  full_block      = { '█', '█', '█', '█', '█', '█', '█', '█' },
  ---@type table
  -- ┌───┐
  -- │   │
  -- └───┘
  diff            = { { '┌', 'DiffText' }, { '─', 'DiffText' }, { '┐', 'DiffText' }, { '│', 'DiffText' },
    { '┘', 'DiffText' }, { '─', 'DiffText' }, { '└', 'DiffText' }, { '│', 'DiffText' }, },
}

return M
