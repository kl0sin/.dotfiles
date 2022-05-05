local status_ok, todo_comments = pcall(require, 'todo-comments')

if not status_ok then
  return
end

todo_comments.setup({
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "", -- "fg" or "bg" or empty
  },
})
