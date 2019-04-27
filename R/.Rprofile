# Set cran mirror
local({
   r <- getOption("repos");
   r["CRAN"] <- "https://cran.rstudio.com/"
   options(repos=r);
   # Sys.setenv(TZ = "")
   # Sys.setenv(TZ = "Australia/Melbourne")
})

if (interactive()) {
  suppressMessages(require(testthat))
}

.First <- function() {
  reticulate::use_condaenv("r-reticulate")
}
# Set default graphics device to X11
# setHook(packageEvent("grDevices", "onLoad"),
#   function(...) grDevices::X11.options(type='cairo'))
# options(device='x11')

options(
  # color scheme see [here](https://help.farbox.com/pygments.html) for a list of supported color schemes, default is `"native"`
  radian.color_scheme = "native",

  # either  `"emacs"` (default) or `"vi"`.
  radian.editing_mode = "vi",

  # auto match brackets and quotes
  radian.auto_match = TRUE,

  # auto indentation for new line and curly braces
  radian.auto_indentation = TRUE,
  radian.tab_size = 2,

  # pop up completion while typing
  radian.complete_while_typing = TRUE,

  # automatically adjust R buffer size based on terminal width
  radian.auto_width = TRUE,

  # insert new line between prompts
  radian.insert_new_line = TRUE,

  # when using history search (ctrl-r/ctrl-s in emacs mode), do not show duplicate results
  radian.history_search_no_duplicates = FALSE,

  # custom prompt for different modes
  radian.prompt = "\033[0;34mr$>\033[0m ",
  radian.shell_prompt = "\033[0;31m#!>\033[0m ",
  radian.browse_prompt = "\033[0;33mBrowse[{}]>\033[0m ",

  # supress the loading message for reticulate
  radian.suppress_reticulate_message = FALSE
)
