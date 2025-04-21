## This is my test code

library(reghelper)
library(tidyverse)

options(scipen = 999)
## 

model <- lm(mpg ~ disp + hp, data = mtcars)

# Std
beta(model)

# Unstd
summary(model)


## 

model <- lm(Sepal.Width ~ Sepal.Length * Species, data = iris)
graph_model(model, y = Sepal.Width, x = Sepal.Length, lines = Species)

###
# Some desc
library(DescTools)

DescTools::Desc(mtcars[, c(1:3)])

usethis::use_github()

# github push test 2
usethis::git_remotes()
gert::git_remote_list()
gert::git_remote_remove("origin")
usethis::git_remotes()

check_and_cleanup_git_remote <- function(remote_name = "origin") {
  # Load required packages
  if (!requireNamespace("usethis", quietly = TRUE)) {
    stop("Please install the 'usethis' package.")
  }
  if (!requireNamespace("fs", quietly = TRUE)) {
    stop("Please install the 'fs' package.")
  }
  
  # Check if this is a Git repo
  repo_path <- usethis::proj_get()
  git_path <- fs::path(repo_path, ".git")
  if (!fs::dir_exists(git_path)) {
    stop("This is not a Git repository.")
  }
  
  # Check existing remotes
  remotes <- usethis::git_remotes()
  
  # Print current remotes
  if (length(remotes) == 0) {
    message("No Git remotes found.")
  } else {
    message("Current Git remotes:")
    print(remotes)
  }
  
  # Check for stale folder
  remote_folder <- fs::path(git_path, "refs", "remotes", remote_name)
  if (fs::dir_exists(remote_folder)) {
    message("\n⚠️ Found a stale remote folder at: ", remote_folder)
    
    if (!(remote_name %in% names(remotes))) {
      response <- readline(prompt = paste0("Do you want to delete this stale folder? (y/n): "))
      if (tolower(response) == "y") {
        fs::dir_delete(remote_folder)
        message("✅ Stale folder deleted.")
      } else {
        message("❌ Folder not deleted.")
      }
    } else {
      message("But a remote with this name exists, so no action taken.")
    }
  } else {
    message("✅ No stale remote folder found.")
  }
  
  invisible(NULL)
}

check_and_cleanup_git_remote()
# some changes new

getwd()
file.edit(".gitignore")
gert::git_status()
