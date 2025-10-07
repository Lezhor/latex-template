# latex-template
A General Template for writing a Thesis in Latex on a Windows WSL Backend.

# CI/CD

You can use the GitHub-Actions located at [.github/workflows/](.github/workflows/) to build your LaTeX Project in the Cloud.

## Setup

1. Setup the Root Directory
    - Edit the [build.yml](.github/workflows/build.yml) Action
    - In Line 11 set `WORKDIR` to your root-directory (aka. replace `./template_thesis` with the path to the directory where your `main.tex` is located)
2. Multiple LaTeX Projects?
    - Your Repository can contain multiple LaTeX Projects in different folders, each with their own `main.tex` file.
    - Choose whichever one you want to build in the Cloud and asign the rootdirectory to the `WORKDIR` variable accordingly.
    - If you want multiple projects to build automatically you will need to duplicate the file and adjust the `WORKDIR` variable for each one of them. When duplicating you need to rename the file **AND** the Action itself (first line in the file)
3. Execution Trigger
    - Default behavior: Builds Latex project on every git push.
    - If you want the action to run only on manual trigger change `push` in line 4 to `workflow_dispatch`
    - Each Exection of the Action will create a new pdf which you can find in the artifacts section of the Action build instance.
        - Note that the pdf is zipped because a GitHub-Action-Artifact can't be a loose file

## Auto Deploy PDF on Discord
Use a Github Action to automatically compile the project and upload compiled pdf on your discord channel.

1. Setup Discord
    - Choose or create channel, where the pdf should be uploaded regularly
    - Go to Edit Channel -> Integrations -> Webhooks -> New Webhook
    - Rename the Webhook to *GitHub* to not get confused
    - Copy the Webhook URL
2. Create Repository Secret
    - In your GitHub Repo go to Settings -> Secrets and Variables -> Actions -> New Repository Secret
    - Name: `DISCORD_WEBHOOK`
    - Secret: `<paste Webhook URL you copied from discord>`
    - Click Add secret
3. Execution
    - The [build.yml](.github/workflows/build.yml) already implements sending the pdf to discord. This step is skipped just skipped if no `DISCORD_WEBHOOK` entry is found.
    - Once you setup the `DISCROD_WEBHOOK` secret, the Action will already be working: On every push the compiled pdf will be uploaded to your Discord Channel via Webhook.
        - Note that you still need to go through the [Setup](#setup) (e.g. set the `WORKDIR`)

If you don't want to push to discord anymore, deleting the repository secret is enough.