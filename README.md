# latex-template
A General Template for writing a Thesis in Latex on a Windows WSL Backend.

# Quickstart
## Windows

<details>
  <summary>1) Install Windows Subsystem for Linux (WSL)</summary>
    <ol>
      <li>Go to Control Panel -> Programs -> Turn Windows feature on or off</li>
      <li>In List of features enable "Virtual Machine Platform" and "Windows Subsystem for Linux</li>
      <li>Restart Computer</li>
      <li>Check if installed: Run <code>wsl --status</code> in CMD</li>
      <li>Run <code>wsl --update</code></li>
    </ol>
</details>

<details>
  <summary>2) Setup WSL Distro</summary>
    <ol>
      <li>Open Microsoft Store</li>
      <li>Search for a Linux Distro of your choice (Debian or Ubuntu recomended)</li>
      <li>Press Install and wait</li>
      <li>Press Open</li>
      <li>Create username and password for your new Virtual Machine</li>
      <li>You're in the Terminal of your Virtual Machine now and can do what you want!</li>
      <li>Once you close the Terminal the VM continues in the background. You can open it again with pressing the Windows Key and typing Debian (or Ubuntu or whatever Distro you chose) - It's like a local App on your machine.</li>
    </ol>
</details>

<details>
  <summary>3) Install TexLive on Virtual Machine</summary>
    <ol>
      <li>Run <code>sudo apt update && sudo apt upgrade -y</code> on your VM</li>
      <li>Run <code>sudo apt install texlive-full</code></li>
      <ul><li>Installing takes quite a while so in the meantime you may proceed with VS-Code (next section)</li></ul>
    </ol>
</details>

<details>
  <summary>4) Setup VS-Code</summary>
    <ol>
      <li>In case you haven't installed Visual Studio Code (on your main Windows OS) yet, do it now (<a href="https://code.visualstudio.com/download" target="_blank">Download-Link</a>)</li>
      <li>Install Extensions via the Extensions Tab in VS-Code</li>
      <ul>
        <li>LaTeX Workwhop Plugin by James Yu</li>
        <li>Remote Development Extension Pack</li>
      </ul>
      <li>Press the green button in the bottom left corner of the screen (the one with a bigger and smaller symbol):</li>
      <img width="289" height="187" alt="image" src="https://github.com/user-attachments/assets/b68787a2-6bb5-4a5e-93c9-979c21164bb6" />
      <li>Choose Option "Connect to WSL" (or "Connect to WSL using Distro" if you have multiple Distros running and want to select a specific one)</li>
      <img width="451" height="236" alt="image" src="https://github.com/user-attachments/assets/82f64099-e67c-4962-89a9-361dd75ecf1e" />
      <li>You can open any project on your VM in VS-Code by pressing Open Folder and selecting the folder in the VM-Filesystem</li>
      <img width="662" height="247" alt="image" src="https://github.com/user-attachments/assets/ac6966f9-cd02-4df6-8e83-ae7829a18dbf" />
    </ol>
</details>






## Linux
PRs are welcome... 😅

## MacOS
PRs are welcome... 😅

Smth with `brew install texlive`

# CI/CD

You can use the GitHub-Actions located at [.github/workflows/](.github/workflows/) to build your LaTeX Project in the Cloud. See [Auto Deploy PDF on Discord](#auto-deploy-pdf-on-discord) for uploading the pdf on discord automatically after build.

## Build Latex with GitHub Actions

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
