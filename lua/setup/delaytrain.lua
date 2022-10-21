    require('delaytrain').setup {
        delay_ms = 4000,  -- How long repeated usage of a key should be prevented
        grace_period = 4, -- How many repeated keypresses are allowed
        keys = {          -- Which keys (in which modes) should be delayed
            ['n'] = {'h', 'j', 'k', 'l'},
            ['nvi'] = {'<Left>', '<Down>', '<Up>', '<Right>'},
        },
    }
