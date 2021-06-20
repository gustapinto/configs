REPOSITORIES_TO_DOWNLOAD=(
    'gustapinto/b3-notifier'
    'gustapinto/cptec-data-extractor'
    'gustapinto/editors-config'
    'gustapinto/fatec'
    'gustapinto/gustapinto.github.io'
    'gustapinto/jupyter-notebooks'
    'gustapinto/notion_mirror'
    'gustapinto/python-studies'
    'gustapinto/rust-studies'
    'gustapinto/utility_scripts'
    'gustapinto/vault_obsidian'
    'projeto-ao/blog'
    'projeto-ao/tcc'
)

for repository in ${REPOSITORIES_TO_DOWNLOAD[@]}; do
    git clone "git@github.com:$repository"
done
