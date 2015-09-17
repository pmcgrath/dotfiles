# Poor PowerShell equivalent of install.sh
# Looked at trying to do symbolic links in Windows - a mess - http://superuser.com/questions/306548/windows-7-mklink-hard-links-attributes-expected-contents-do-not-affect
# So here I just copy the content if it does not exist - if it does I will stop and give a message

function make-copy($sourcePath, $targetPath)
{
	if (test-path $targetPath) { write-host "Skipping [$sourcePath] as target already exists - you need to decide what to do with it - delete and re-run or edit and fix up"; return; }
	cp $sourcePath $targetPath -r
}

# Store source directory path 
$sourceDirectoryPath = split-path $PSCommandPath

# Home - don't want to rely on $HOME environment variable as not always set in PowerShell
$homePath = (resolve-path ~).Path

# .git content
make-copy $sourceDirectoryPath\_gitconfig $homePath\.gitconfig

# Vim content
make-copy $sourceDirectoryPath\_vim $home_path\vimfiles
make-copy $sourceDirectoryPath\_vimrc $homePath\_vimrc

