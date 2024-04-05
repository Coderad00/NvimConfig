-- Plugin-Informationen
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Tastaturkürzel mit `vim.keymap` definieren (übliche Vorgehensweise)
    local keymap = vim.keymap

    -- Harpoon-Tastaturkürzel mit klaren Beschreibungen
    keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { noremap = true, silent = true, desc = "Markiere aktuelle Datei mit Harpoon" })
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { noremap = true, silent = true, desc = "Gehe zum nächsten Harpoon-Marker" })
    keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { noremap = true, silent = true, desc = "Gehe zum vorherigen Harpoon-Marker" })

    -- Zusätzliche Harpoon-Tastaturkürzel (Anpassung möglich)
    -- Diese Tastenkombinationen können nach deinen Wünschen angepasst werden.
    keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", { noremap = true, silent = true, desc = "Markiere aktuelle Datei mit Harpoon" })  -- Duplikat von "<leader>hm"
    keymap.set("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { noremap = true, silent = true, desc = "Schalte Harpoon-Schnellmenü um" })
    keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { noremap = true, silent = true, desc = "Gehe zu Harpoon-Marker 1" })
    keymap.set("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { noremap = true, silent = true, desc = "Gehe zu Harpoon-Marker 2" })
    keymap.set("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { noremap = true, silent = true, desc = "Gehe zu Harpoon-Marker 3" })
    keymap.set("n", "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { noremap = true, silent = true, desc = "Gehe zu Harpoon-Marker 4" })
  end,
}
