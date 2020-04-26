require 'html-proofer'

task :test do
  sh "bundle exec jekyll build"
  options = {
    :assume_extension => true,
    :allow_hash_href => true,
    :check_favicon => true,
    :check_html => true,
    :checks_to_ignore => ["alt_ignore", "empty_alt_ignore"],
    :empty_alt_ignore => true,
    :disable_external => true
  }
  HTMLProofer.check_directory("./_site", options).run
end
