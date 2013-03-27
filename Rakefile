task :default => [:backup_dir, :backup, :link]

DOTFILES_DIR = ".dotfiles"
BACKUP_DIR = "backup"
DOTFILES = %w(
  ackrc
  bashrc
  bash_profile
  curlc
  gemrc
  gitconfig
  gitignore_global
  inputrc
  rvmrc
)

desc %(Make symlinks of dotfiles)
task :link do
  DOTFILES.each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join(DOTFILES_DIR, script), dotfile
    end
  end
end

desc %(Backup existing dotfiles)
task :backup do
  DOTFILES.each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist?(dotfile) && !File.symlink?(dotfile)
      backup = File.join(BACKUP_DIR, script)
      if File.exists? backup
        warn "#{BACKUP_DIR}/#{script} already exists"
      else
        mv dotfile, backup
      end
    end
  end
end

desc %(Create backup dir)
task :backup_dir do
  mkdir_p BACKUP_DIR unless File.directory?(BACKUP_DIR)
end
