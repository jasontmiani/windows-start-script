#-------------------------------------------------------------------------------#
#                                                                               #
# Scripts I use to create a new windows dev, gaming, and  general personal use
#                                                                               #
#                                                                       -Kalzad #
#                                                                               #
#-------------------------------------------------------------------------------#

#
# Functions
#

function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

#
# Package Managers
#

# Choco
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | iex
Update-Environment-Path

#
# Git
#

choco install git --yes --params '/GitAndUnixToolsOnPath'
git config --global color.ui "auto"


#
# AWS awscli
#
# choco install awscli --yes
Update-Environment-Path


#
# Languages
#

Update-Environment-Path

# Node
choco install nodejs.install --yes
Update-Environment-Path
npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest

npm install -g install-peerdeps
npm install -g typescript
# npm install prettier-eslint --save-dev

npm install -g npm

#
# Docker
# 

# Hyper-V required for docker and other things
Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart


choco install docker --yes
choco install docker-machine --yes
choco install docker-compose --yes
choco install docker-for-windows --yes

Update-Environment-Path



# Yarn
# use npm i -g until yarn 2.0 has choco pkg
npm install -g yarn@berry

# choco install yarn --yes 


# ESLint
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
npm install -g install-peerdeps
install-peerdeps --dev eslint-config-airbnb

#
# VS Code
#

choco install vscode --yes # includes dotnet
Update-Environment-Path
git config --global core.editor "code --wait"

# Kalzad VSCode extensions

code --install-extension aaron-bond.better-comments
code --install-extension alefragnani.project-manager
code --install-extension anseki.vscode-color
code --install-extension antfu.i18n-ally
code --install-extension auchenberg.vscode-browser-preview
code --install-extension axosoft.gitkraken-glo
code --install-extension bierner.markdown-preview-github-styles
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension chrmarti.regex
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension demijollamaxime.bulma
code --install-extension docsmsft.docs-article-templates
code --install-extension docsmsft.docs-images
code --install-extension docsmsft.docs-markdown
code --install-extension docsmsft.docs-metadata
code --install-extension docsmsft.docs-preview
code --install-extension docsmsft.docs-yaml
code --install-extension donjayamanne.githistory
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension dzhavat.git-cheatsheet
code --install-extension eamodio.gitlens
code --install-extension ecmel.vscode-html-css
code --install-extension Equinusocio.vsc-community-material-theme
code --install-extension Equinusocio.vsc-material-theme
code --install-extension eridem.vscode-postman
code --install-extension esbenp.prettier-vscode
code --install-extension felipecaputo.git-project-manager
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension gamunu.vscode-yarn
code --install-extension Glavin001.unibeautify-vscode
code --install-extension gottfired.css2react
code --install-extension Gruntfuggly.todo-tree
code --install-extension humao.rest-client
code --install-extension idleberg.icon-fonts
code --install-extension joelday.docthis
code --install-extension johnpapa.vscode-peacock
code --install-extension kisstkondoros.vscode-gutter-preview
code --install-extension KnisterPeter.vscode-github
code --install-extension konstantin.wrapSelection
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension lannonbr.vscode-js-annotations
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.typescript-javascript-grammar
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension ms-vsonline.vsonline
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.vscode-react-native
code --install-extension natqe.reload
code --install-extension Orta.vscode-react-native-storybooks
code --install-extension PKief.material-icon-theme
code --install-extension pkosta2005.heroku-command
code --install-extension pranaygp.vscode-css-peek
code --install-extension raathigeshan.fabulous
code --install-extension RandomFractalsInc.vscode-data-preview
code --install-extension redhat.vscode-yaml
code --install-extension ritwickdey.LiveServer
code --install-extension shailen.netlify
code --install-extension Shan.code-settings-sync
code --install-extension shyykoserhiy.vscode-spotify
code --install-extension sketchbuch.vsc-quokka-statusbar
code --install-extension softwaredotcom.music-time
code --install-extension softwaredotcom.swdc-vscode
code --install-extension steoates.autoimport
code --install-extension stevencl.addDocComments
code --install-extension syler.sass-indented
code --install-extension ThreadHeap.serverless-ide-vscode
code --install-extension TimVaneker.serverless-snippets
code --install-extension TMcGinn.insight
code --install-extension tombonnike.vscode-status-bar-format-toggle
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension WallabyJs.quokka-vscode
code --install-extension WallabyJs.wallaby-vscode
code --install-extension wix.glean
code --install-extension wmira.react-playground-vscode
code --install-extension xabikos.JavaScriptSnippets
code --install-extension zhuangtongfa.material-theme
code --install-extension Zignd.html-css-class-completion
code --install-extension ziyasal.vscode-open-in-github
code --install-extension eg2.vscode-npm-script



# React support
code --install-extension vsmobile.vscode-react-native
npm install -g create-react-native-app
npm install -g react-native-cli
npm install -g create-react-app
npm install -g expo-cli

# yarn global dep

yarn global add  create-react-native-app
yarn global add react-native-cli
yarn global add create-react-app

# Docker support
code --install-extension PeterJausovec.vscode-docker

#
# Static Site Generators
#

# GatsbyJS
npm install -g gatsby-cli


# File Management
choco install 7zip --yes


# Browsers
choco install googlechrome --yes

# Misc
choco install firacode --yes # See https://www.youtube.com/watch?v=KI6m_B1f8jc
choco install spotify --yes
choco install discord --yes
choco install steam --yes
choco install ccleaner --yes
choco install powertoys --yes


Update-Environment-Path


# Terminal Emulators

choco install spacemacs --yes
choco install microsoft-windows-terminal --yes

# This installs PowerShell 7+. It supports modifying the context menu!
msiexec.exe /package PowerShell-7.0.3-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1

# this loads all the terminal emulators into the context menu. tyvm @lextm https://github.com/lextm/windowsterminal-shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/lextm/windowsterminal-shell/master/install.ps1'))

Update-Environment-Path


Write-Output "Finished! Run `choco upgrade all` to get the latest software"

