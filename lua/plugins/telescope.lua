return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            prompt_prefix = " ",
          },
        },
        pickers = {
          jumplist = {
            theme = "ivy",
            prompt_prefix = " ",
          },
          live_grep = {
            theme = "ivy",
            prompt_prefix = " ",
          },
          buffers = {
            theme = "ivy",
            prompt_prefix = " ",
          },
          find_files = {
            theme = "ivy",
            prompt_prefix = " ",
          }
        }
      }
      telescope.load_extension "file_browser"
    end
  }
}
