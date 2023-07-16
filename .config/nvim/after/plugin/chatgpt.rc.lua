local status_ok, chatgpt = pcall(require, 'chatgpt')
if not status_ok then return end

chatgpt.setup({
  openai_params = { model = "gpt-3.5-turbo-16k-0613", max_tokens = 8000 },
})
