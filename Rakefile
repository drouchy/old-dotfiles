require 'rake'

task :default => ["install"]

ZSH_PLUGINS = %w(git://github.com/zsh-users/zsh-syntax-highlighting.git)
VIM_PLUGINS = [
    'git://github.com/tpope/vim-endwise.git',
    'https://github.com/wincent/Command-T.git',
    'git://github.com/jgdavey/vim-blockle.git',
    'git://github.com/kchmck/vim-coffee-script.git',
    'git://github.com/tpope/vim-fugitive.git',
    'git://github.com/garbas/vim-snipmate.git',
    'git://github.com/tpope/vim-rails.git',
    'git://github.com/tpope/vim-surround.git',
    'git://github.com/chriskempson/vim-tomorrow-theme.git',
    'git://github.com/othree/html5.vim.git',
    'git://github.com/rorymckinley/vim-symbols-strings.git',
    'git://github.com/MarcWeber/vim-addon-mw-utils.git',
    'git://github.com/tomtom/tlib_vim.git',
    'git://github.com/mileszs/ack.vim.git',
    'git://github.com/ecomba/vim-ruby-refactoring.git',
    'git://github.com/edsono/vim-matchit.git',
    'git://github.com/vim-ruby/vim-ruby.git',
    'git://github.com/godlygeek/tabular.git',
  ]
  
def clone(url, directory)
  name = url.split('/').last.downcase.gsub('vim-', '')
  name = name[0..name.rindex('.git')-1]
  cmd = "git clone #{url} #{directory}/#{name}"
  system cmd
end

desc "Clone git repositories"
task :clone do
  ZSH_PLUGINS.each { |url| clone(url , 'zsh-custom/plugins') }
  system 'mkdir -P vim/bundler 2>/dev/null'
  VIM_PLUGINS.each { |url| clone(url, 'vim/bundle')}
end

desc "install the files into the user's home directory"
task install: [:clone, :config_files] do
  system 'cd ~/.vim/bundle/command-t/ruby/command-t && rbenv local system && \rake make'
  puts "Installation complete!"
end

desc "symlink the config files"
task :config_files do
  Dir.entries('config').reject { |f| f.start_with?('.') }.each { |f| replace_file("config/#{f}")}
  system %Q(rm -fr ~/.oh-my-zsh/custom)
  link_directory('zsh-custom', '.oh-my-zsh/custom')
  link_directory('vim', '.vim')
  system "ln -s ~/.oh-my-zsh/custom/themes/custom-juanghurtado.zsh-theme ~/.oh-my-zsh/themes/custom-juanghurtado.zsh-theme"
end

def replace_file(file)
  file_name = File.basename(file)
  system %Q(rm -f ~/.#{file_name})
  link_file(file)
end

def link_file(file)
  file_name = File.basename(file)
  puts "linking ~/.#{file_name}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file_name}"}
end

def link_directory(directory, dest = nil)
  dest = directory if dest.nil?
  puts "linking #{directory}"
  system %Q(rm -f "$HOME/#{dest}")
  system %Q{ln -s "$PWD/#{directory}" "$HOME/#{dest}"}
end
