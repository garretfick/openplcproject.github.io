require 'nokogiri'

task :checkhtml do
  sh "bundle exec jekyll build"

  num_with_errors = 0
  last_error = ""
  files = Dir['_site/**/*.html']
  for file_name in files do
    file = File.open(file_name).read
    # Max errors is default to nil, which returns 0 error. This just
    # needs any positive number of which 10 satisfies the conditions
    begin
      doc = Nokogiri::HTML5(file, max_errors: 10)

      if doc.errors.length > 0
        puts("Error: " + file_name + "\n")
        doc.errors.each do |err|
          puts(err)
          last_error = err
        end

        num_with_errors += 1
      else
        puts("OK: " + file_name + "\n")
      end
    rescue => ex
      puts("Error: " + file_name + "\n")
      puts(ex)
      num_with_errors += 1
    end
  end

  if num_with_errors > 0
    puts("Num files with errors:" + num_with_errors.to_s + "\n")
    raise "One or more files contains an error. Last error: " + last_error
  end
end

task :spellcheck do
  sh "bundle exec jekyll build"
  sh "aspell --lang=en create master ./aspell-dict.rws < ./aspell-dict.txt"

  num_with_errors = 0
  last_error = ""
  files = Dir['_site/**/*.html']
  for file_name in files do
    misspelled = `cat #{file_name} | aspell --list -H --html-skip=script --add-html-skip=style --add-html-skip=pre --add-html-skip=code --extra-dicts=./aspell-dict.rws | sed '/^$/d'`
    if misspelled.length > 0
      puts("Error: " + file_name + " words: " + misspelled)
      num_with_errors += 1
    else
      puts("OK: " + file_name)
    end
  end

  if num_with_errors > 0
    puts("Num files with errors:" + num_with_errors.to_s + "\n")
    raise "One or more files contains an misspelling. Add false positives to aspell-dict.txt"
  end
end
