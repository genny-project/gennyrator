# gennyrator

A project that generates genny projects (repositories and infrastructure) based on required input parameters:
- Github repository template
- Environment details for infrastructure deployment

This is how the scripts could be used to create a Github repository (based on https://github.com/cli/cli):

% cd scripts/

% ./generate.sh genny-project genny-project-template genny-project new_project_repo private new-project dev



PS: The infrastcture build is still WIP
