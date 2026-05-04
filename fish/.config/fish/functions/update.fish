function update -d "Update all package managers and apps"
    set -l bold (set_color --bold)
    set -l normal (set_color normal)

    function _update_step
        echo
        echo "$bold→ $argv$normal"
    end

    # macOS software update
    if test (uname) = Darwin
        _update_step "sudo softwareupdate -i -a"
        sudo softwareupdate -i -a
    end

    # Homebrew
    _update_step "brew update"
    brew update
    _update_step "brew upgrade"
    brew upgrade
    _update_step "brew upgrade --cask --greedy"
    brew upgrade --cask --greedy
    _update_step "brew cleanup"
    brew cleanup

    # mise (manages runtimes: node, python, ruby, etc.)
    if command -q mise
        _update_step "mise upgrade"
        mise upgrade
    end

    # Fisher (fish plugin manager)
    if functions -q fisher
        _update_step "fisher update"
        fisher update
    end

    # npm global packages
    if command -q npm
        _update_step "npm update -g"
        npm update -g
    end

    functions -e _update_step
    echo
    echo "$bold✓ All updates complete.$normal"
end
