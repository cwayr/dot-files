return {
    "lalitmee/browse.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local browse = require("browse")
        local keymap = vim.keymap

        browse.setup({
            provider = "google", -- google, duckduckgo, bing, brave
            icons = {
                bookmark_alias = "  ",
                bookmarks_prompt = "󰂺 ",
                grouped_bookmarks = "",
            }
        })

        ----------------- bookmarks -----------------

        local function command(name, rhs, opts)
            opts = opts or {}
            vim.api.nvim_create_user_command(name, rhs, opts)
        end

        local function get_remote_origin()
            local handle = io.popen("git config --get remote.origin.url")
            if handle == nil then
                return "no remote origin found"
            end
            local result = handle:read("*a")
            handle:close()
            return string.sub(result, 1, -6)
        end

        local remote_origin = get_remote_origin()
        local workflow_runs = remote_origin .. "/actions"

        local bookmarks = {
            ["AWS Console"] = "https://console.aws.amazon.com",
            ["AWS CDK API Reference"] = "https://docs.aws.amazon.com/cdk/api/v2/docs/aws-construct-library.html",
            ["AWS CDK Docs"] = "https://docs.aws.amazon.com/cdk/latest/guide/home.html",
            ["Zig Guide"] = "https://zig.guide/",
            ["Tailwind Colors"] = "https://tailwindcss.com/docs/customizing-colors",
            ["Shadcn/ui Components"] = "https://ui.shadcn.com/docs/components/accordion",
            ["Nextjs"] = "https://nextjs.org/docs/getting-started",
            ["Reactjs"] = "https://reactjs.org/docs/getting-started.html",
            ["Svelte"] = "https://svelte.dev/docs",
            ["Remote Origin"] = remote_origin,
            ["Workflow Runs"] = workflow_runs
        }

        ---------------- searches ----------------

        command("Google", function()
            browse.input_search()
        end, {})

        command("GitHub", function()
            local github = {
                ["Code search"] = "https://github.com/search?q=%s&type=code",
                ["Repo search "] = "https://github.com/search?q=%s&type=repositories",
            }
            browse.open_bookmarks({ bookmarks = github, prompt_title = "GitHub Search" })
        end, {})

        command("Bookmarks", function()
            browse.open_bookmarks({ bookmarks = bookmarks })
        end)

        -- keymaps
        keymap.set("n", "<leader>gl", ":Google<CR>")
        keymap.set("n", "<leader>gh", ":GitHub<CR>")
        keymap.set("n", "<leader>bm", ":Bookmarks<CR>")
    end,
}
