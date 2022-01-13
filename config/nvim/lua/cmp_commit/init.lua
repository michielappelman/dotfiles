local source = {}
source.new = function() return setmetatable({}, {__index = source}) end

function source:is_available()
  return vim.bo.filetype == "gitcommit" or vim.bo.filetype ==
             "NeogitCommitMessage"
end
function source:get_trigger_characters() return {''} end

function source:complete(_, callback)
  callback({
    {label = 'Add ', detail = 'Git: Create a capability'},
    {label = 'Drop ', detail = 'Git: Delete a capability'},
    {label = 'Fix ', detail = 'Git: Fix an issue'},
    {label = 'Bump ', detail = 'Git: Increase the version of something'}, {
      label = 'Make ',
      detail = 'Git: Change the build process, or tools, or infrastructure'
    }, {label = 'Start ', detail = 'Git: Begin doing something'},
    {label = 'Stop ', detail = 'Git: End doing something'}, {
      label = 'Optimize ',
      detail = 'Git: A change that MUST be just about performance'
    }, {
      label = 'Document ',
      detail = 'Git: A change that MUST be only in the documentation'
    },
    {
      label = 'Refactor ',
      detail = 'Git: A change that MUST be just refactoring'
    }, {label = 'Reformat ', detail = 'Git: A change that MUST be just format'},
    {label = 'Rephrase ', detail = 'Git: A change that MUST be just textual'}
  })
end

function source:execute(completion_item, callback) callback(completion_item) end
function source:resolve(completion_item, callback) callback(completion_item) end
return source
