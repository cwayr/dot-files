local prompts = {
    -- Code related prompts
    Explain = "Please explain how the following code works.",
    Review = "Please review the following code and provide suggestions for improvement.",
    Test = "Please explain how the selected code works, then generate unit tests for it.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    FixCode = "Please fix the following code to make it work as intended.",
    FixError = "Please explain the error in the following text and provide a solution.",
    Documentation = "Please provide documentation for the following code.",
}

return {
    -- {
    --     "github/copilot.vim",
    --     config = function()
    --         require("copilot").setup()
    --     end
    -- },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "main",
            dependencies = {
                { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
                { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
                {
                  "iamcco/markdown-preview.nvim",
                  ft = { "markdown", "copilot-chat" },
                }
            },
            opts = {
                question_header = "# User",
                answer_header = "# Copilot",
                error_header = "# [!ERROR] Error",
                highlight_headers = false,
                separator = "",
                window = {
                    layout = "float",
                    height = 0.85,
                    width = 0.75
                },
                prompts = prompts,
                auto_follow_cursor = false, -- Don't follow the cursor after getting response
                show_help = false, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
                mappings = {
                    -- Use tab for completion
                    complete = {
                        detail = "Use @<Tab> or /<Tab> for options.",
                        insert = "<Tab>",
                    },
                    -- Close the chat
                    close = {
                        normal = "q",
                        insert = "<C-c>",
                    },
                    -- Reset the chat buffer
                    reset = {
                        normal = "<C-l>",
                        insert = "<C-l>",
                    },
                    -- Show the prompt
                    show_info = {
                        normal = "gmp",
                    },
                    -- Show the user selection
                    show_context = {
                        normal = "gms",
                    },
                },
            },
            config = function(_, opts)
                local chat = require("CopilotChat")
                local select = require("CopilotChat.select")
                -- Use unnamed register for the selection
                opts.selection = select.unnamed

                opts.prompts.CommitStaged = {
                    prompt = "Write a commit message for the change with commitizen convention",
                    selection = function(source)
                        return select.gitdiff(source, true)
                    end,
                }

                chat.setup(opts)

                vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
                    chat.ask(args.args, { selection = select.visual })
                end, { nargs = "*", range = true })

                -- Restore CopilotChatBuffer
                vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
                    chat.ask(args.args, { selection = select.buffer })
                end, { nargs = "*", range = true })

                -- Custom buffer for CopilotChat
                vim.api.nvim_create_autocmd("BufEnter", {
                    pattern = "copilot-*",
                    callback = function()
                        vim.opt_local.relativenumber = true
                        vim.opt_local.number = true

                        -- Get current filetype and set it to markdown if the current filetype is copilot-chat
                        local ft = vim.bo.filetype
                        if ft == "copilot-chat" then
                            vim.bo.filetype = "markdown"
                        end
                    end,
                })
            end,
            event = "VeryLazy",
            keys = {
                -- Show prompts actions with telescope
                {
                    "<leader>ap",
                    function()
                        local actions = require("CopilotChat.actions")
                        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                    end,
                    desc = "CopilotChat - Prompt actions",
                },
                -- Custom input for CopilotChat // uses current copy register
                {
                    "<leader>ai",
                    function()
                        local input = vim.fn.input("Ask Copilot: ")
                        if input ~= "" then
                            vim.cmd("CopilotChat " .. input)
                        end
                    end,
                    desc = "CopilotChat - Ask input",
                },
                -- Generate commit message based on the git diff
                {
                    "<leader>am",
                    "<cmd>CopilotChatCommitStaged<cr>",
                    desc = "CopilotChat - Generate commit message for staged changes",
                },
                { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
            },
        },
    }
}
