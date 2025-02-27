-- Shows available keymaps
return {
  'folke/which-key.nvim',
   event = 'VeryLazy',
   opts = {
     preset = 'helix'
   },
   keys = function() 
     local wk = require('which-key')
     wk.add({
       -- groups
       {'<leader>s', group = "search"},
       {'<leader>b', group = 'buffers', name = 'buffers'},
       {'<leader>o', group = 'open', icon = ''},
       {'<leader>w', group = 'windows'},
       {'<leader>g', group = 'git'},
       -- set/override icons for existing mappings
       {'<leader>op', icon = ''},
       {'<leader>wd', icon = ''},
       {'<leader>wh', icon = ''},
       {'<leader>wl', icon = ''},
       {'<leader>wj', icon = ''},
       {'<leader>wk', icon = ''},
       {'<leader>ws', icon = ''},
       {'<leader>wv', icon = ''},
       {'<leader>bd', icon = '󰆴'},
     })
     return {}
    end,
}
