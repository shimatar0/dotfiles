-- lua/plugins/iron-python.lua
return {
  "Vigemus/iron.nvim",
  config = function()
    local iron   = require("iron.core")
    local view   = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,                 -- バッファに紐付かないREPL
        repl_open_cmd = view.bottom(15),     -- 画面下に高さ15行で開く
        -- ここが「普通のPythonファイル向け」の肝
        repl_definition = {
          python = {
            -- venv/conda を優先し、なければ ipython → python3 の順で起動
            command = function()
              local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
              local has  = function(bin)
                return vim.fn.executable(bin) == 1
              end
              if venv and has(venv .. "/bin/ipython") then
                return { venv .. "/bin/ipython", "--no-autoindent" }
              elseif has("ipython") then
                return { "ipython", "--no-autoindent" }
              elseif venv and has(venv .. "/bin/python") then
		return { venv .. "/bin/python", "-m", "jupyter", "console", "--kernel=python3" }
              else
                return { "python3" }
              end
            end,
            -- 複数行送信の貼り付け崩れを防ぐ（インデント保持）
            format = common.bracketed_paste_python,
            -- セル区切り
            block_dividers = { "# %%", "#%%" },
          },
        },
        dap_integration = false,
      },
      keymaps = {
        toggle_repl = "<space>rr",         -- REPL 開閉/起動
        restart_repl = "<space>rR",        -- 再起動
        send_line = "<space>sl",           -- 現在行
        visual_send = "<space>sc",         -- 選択範囲（ビジュアル）
        send_file = "<space>sf",           -- ファイル全体
        send_paragraph = "<space>sp",      -- 段落（空行区切り）
        send_code_block = "<space>sb",     -- セル（# %%）
        send_code_block_and_move = "<space>sn", -- 送って次セルへ
        clear = "<space>cl",               -- REPL 画面クリア
        exit  = "<space>sq",               -- REPL 終了
        interrupt = "<space>s<space>",     -- 割り込み（Ctrl-C相当）
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    })

    -- REPLのフォーカス移動用（任意）
    vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
  end
}
