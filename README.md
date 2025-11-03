# latex-template
A collection of LaTeX Templates, you can use on your local Machine in Visual Studio Code. 
These templates allow you to compile the Latex Project(s) right inside of Visual Studio Code.
Additionally GitHub Actions can be configured to build your LaTeX-Project directly inside the GitHub Cloud (see [CI/CD](#cicd)) and even upload the resulting pdf to a Discord Channel of your choice for convenient access on the go (see [Auto Deploy PDF on Discord](#auto-deploy-pdf-on-discord)).

## List of featured templates:
- `_templates/template_thesis/` - HTW Thesis (the Title Page is given by the HTW and can't be changed)
- `_templates/template_paper/` - Similar to HTW Thesis but with a custom pretty title page
- `_templates/template_beamer/` - Presentation with a custom style, matching the HTW style.
- `_templates/template_ieee/` - (coming soon) A paper format, ready to be submited to an IEEE-Conference

If you have any suggestions regarding one of the existing templates or have an idea for a new template, feel free to make a Pull Request.
But please reach out to me first, e.g. by creating a GitHub-Issue where you elaborate on your idea.

# Environment Setup
Note that you can skip this entire section, if you choose to work in Overleaf instead of your local machine.
However, this defeats the entire purpose of this template.
Working on a local setup is recomended, e.g. because Overleaf has a limited Build Time, which makes it impossible to work with (without a premium subscription), once your project becomes too big.

## Windows

<details>
  <summary>1) Install Windows Subsystem for Linux (WSL)</summary>
    <ol>
      <li>Go to Control Panel -> Programs -> Turn Windows feature on or off</li>
      <li>In List of features enable "Virtual Machine Platform" and "Windows Subsystem for Linux"</li>
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
      <li>Press Open (This should start a Terminal window, which is connected to your newly installed Virtual Machine)</li>
      <li>Create username and password for your new VM</li>
      <li>The Virtual Machine is setup and running and you can do whatever you want on it</li>
      <li>Once you close the Terminal the VM continues to run in the background. You can open it again by pressing the Windows Key and typing Debian (or Ubuntu or whatever Distro you chose) - It's like a local App on your Windows Machine.</li>
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
      <li>Install the following Extensions via the Extensions Tab in VS-Code:</li>
      <ul>
        <li>LaTeX Workwhop Plugin by James Yu</li>
        <li>Remote Development Extension Pack</li>
      </ul>
      <li>Check if TexLive has finished installing (The next step needs it)</li>
      <li>Press the green button in the bottom left corner of the VS-Code window (the one with a bigger and smaller symbol):</li>
      <img width="289" height="187" alt="image" src="https://github.com/user-attachments/assets/b68787a2-6bb5-4a5e-93c9-979c21164bb6" />
      <li>Choose Option "Connect to WSL" (or "Connect to WSL using Distro" if you have multiple Distros running and want to select a specific one)</li>
      <img width="451" height="236" alt="image" src="https://github.com/user-attachments/assets/82f64099-e67c-4962-89a9-361dd75ecf1e" />
      <li>You can open any project on your VM in VS-Code by pressing Open Folder and selecting the folder in the VM-Filesystem</li>
      <img width="662" height="247" alt="image" src="https://github.com/user-attachments/assets/ac6966f9-cd02-4df6-8e83-ae7829a18dbf" />
    </ol>
</details>

<details>
  <summary>5) Set up SSH on VM</summary>
    <ol>
      <li>Open the VM Terminal (Open App Debian, Ubuntu, whatever Distro you chose)</li>
      <li>Run <code>ssh-keygen -t ed25519 -C "your_email@example.com</code> to generate public/private keypair</li>
      <ul><li>When prompted to Enter a passphrase enter a short phrase for verification. Note that you will need to type this phrase EVERY TIME you use your SSH key, aka. on every Push and Pull. If this sounds too annoying you can skip it by leaving the passphrase empty.</li></ul>
      <li>Run <code>eval "$(ssh-agent -s)</code> to launch the ssh agent</li>
      <li>Run <code>ssh-add ~/.ssh/id_ed25519</code> to add the key to your agent.</li>
      <ul><li>Note that you need to add your private key (which has no extension) and not the public key</li>
      <li>The ssh file might have another name. Doublecheck the name in <code>~/.ssh/</code></li></ul>
    </ol>
</details>

<details>
  <summary>6) Set up SSH on GitHub (<a href="https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account" target="_blank">official documentation</a>)</summary>
    <ol>
      <li>Run <code>cat ~/.ssh/id_ed25519.pub | clip.exe</code> in your VM Terminal to copy your public key to the Windows Clipboard</li>
      <li>On the GitHub WebSite click your profile picture, then click Settings</li>
      <li>In th "Access" secion of the sidebar, click SSH and GPG keys</li>
      <li>Click New SSH key or Add SSH Key</li>
      <li>Give your SSH-Key a name (idealy featuring words WSL or the name of your WSL Distro</li>
      <li>Select "authentication" as the type of key</li>
      <li>Paste your public key in the key field</li>
      <li>Click Add SSH key</li>
    </ol>
</details>


## Linux
PRs are welcome... 😅

- Prob. TexLive and VS-Code on on same native OS / no need for VM.

## MacOS
PRs are welcome... 😅

- Prob. smth with `brew install texlive`


# Quickstart (LaTeX Repository)
1. If you are using this Template for the first time, you will need to complete the [Environment Setup Section](#environment-setup) first before continuing with this section.
2. Create a new GitHub repository, using this repository as a Template.
    - You will be able to have multiple latex Projects inside a single repository, so in some cases one Repo is enough for all your projects.
3. Clone your new Repository to the OS where the TexLive Server is running
    - On Windows this will be your WSL. Open the WSL Terminal and run `git clone github/link_to_your_repo.git` in a workdirectory you want the project to be in (e.g. `~/github/`)
4. Open the Repository in Visual Studio Code
5. Choose a template from the `_templates` folder, you want to use for your project. 
    - See [List of featured templates](#list-of-featured-templates) for an overview of each template in this repo
6. Copy your chosen template to the root of the repo and rename it.
    - In VS-Code you can Ctrl + Drag the desired template folder to the root of your repository to copy it.
    - Your filestructure should look like this now:
```
repository/
├─ _templates/
│  ├─ template_beamer/
│  ├─ template_paper/
│  ├─ template_thesis/
├─ .github/
├─ .vscode/
├─ your_copied_template/
│  ├─ src/
│  ├─ main.tex
├─ .gitignore
├─ LICENSE
├─ README.md
```
7. Build the `main.tex` file
    - If you installed the Latex Workshop Extension correctly, a green play button shoult appear in the top right corner of the screen, whenever you open the `main.tex` of the project you just copied.
    - Press it
    - If you did everything correctly a `main.pdf` file should appear in the same folder as the `main.tex`
    - Either open the `main.pdf` in split view or pin the according Tab in VS-Code, since you will need to view it often.
    - Whenever you edit and save the `main.tex` (or any subfile which is included in the `main.tex`) the project rebuilds automatically and you should see the changes in the `main.pdf` after a couple of seconds.
8. Choose the Language by changing `language=en` to `language=de` (or vice verca) in the first line of `main.tex`
9. Update the titlepage by editing the `main.tex`. Update the values of the titlepage commands (right after `\begin{document}`) to hold the values you want to display on your titlepage.
    - This is an overview of all titlepage-values with the templates that use them and those that don't:

|  | `template_paper` | `template_thesis` | `template_beamer` |
|----------|-------------|-------------|------------|
| `\ititle` | ✔ | ✔ | ✔ |
| `\idocumenttype` | ✔ | ✔ | ✔ |
| `\iuniversity` | ✔ | ✔ | ✔ |
| `\ifaculty` | ✔ | ✔ | ✔ |
| `\istudypgoramme` | ✔ | ✔ | ✔ |
| `\isupervisorone` | | ✔ | |
| `\isupervisortwo` | | ✔ | |
| `\iauthor` | ✔ | ✔ | ✔ |
| `\imatrnr` | ✔ | ✔ | ✔ |
| `\idate` | ✔ | ✔ | ✔ |

## Using this Latex Setup
<details>
  <summary>Hidden Files</summary>
    <ol>
      <li>Latex uses many intermediate files to build your main.tex</li>
      <li>All these fileformats (e.g. <code>.aux</code>, <code>.bbl</code>, <code>.log</code>, <code>.lol</code>, <code>.glo</code>, etc.) are ignored by git (see <code>.gitignore</code>) but also are configured to be invsible inside vs-code (see <code>.vscode/settings.json</code>).</li>
      <li>If for some reason you need to access these files (e.g. the log files etc.) you will need to access them via your file explorer or the terminal</li>
    </ol>
</details>


<details>
  <summary>Subfiles</summary>
    <ol>
      <li>Do yourself a favor - Use Subfiles!</li>
      <li>Each template has an example use of a tex-file in <code>src/tex/</code> which is included in <code>main.tex</code> using <code>\input{src/tex/your_subfile.tex}</code></li>
      <li>You can also use subfiles inside of subfiles</li>
      <li>While <code>main.tex</code> is located in the projects root, the subfiles should be located in <code>src/tex/</code></li>
      <li>For a huge project, consider spliting the <code>src/tex/</code> into multiple subfolers (e.g. one for each chapter / topic)</li>
    </ol>
</details>


<details>
  <summary>Bibliography</summary>
    <ol>
      <li>Bibfiles are located at <code>src/bibliography/</code></li>
      <li>Add as many as you want</li>
      <li>You have to register each one in <code>main.tex</code>, just like the example <code>custom_bibliography.bib</code> file</li>
      <li>Each Bibitem will have an ID (in the first line of its definition)</li>
      <li>using this ID you can cite your reference using <code>\cite{bib_id}</code></li>
      <ul>
        <li>or use <code>\nocite{bib_id}</code> if you don't want the citation number to appear in text but want to add the reference to the References section (useful for presentations)</li>
      </ul>
    </ol>
</details>

<details>
  <summary>Glossaries and Acronyms</summary>
    <ol>
      <li>Define new Acronym in <code>src/acronyms.tex</code> using: <code>\newacronym{reinforcement-learning}{RL}{Reinforcement Learning}</code></li>
      <li>Define new Glossary Entry in <code>src/glossary.tex</code> using: <code> \newglossaryentry{dijkstra}{ name={Dijkstra}, description={Really cool Graph-Algorithm} } </code></li>
      <li>use the acronym using <code>\gls{reinforcement-learning}</code></li>
      <li>use the glossary entry using <code>\gls{dijkstra}</code></li>
      <li>The acronyms and glossary are configured to be printed at the end of your document.</li>
    </ol>
</details>

<details>
  <summary>Packages</summary>
    <ol>
      <li>The packages are imported not in the <code>main.tex</code> but instead in the according <code>.sty</code> files (see <code>style/</code> directory in each template)</li>
      <li>e.g. see the <code>htwstyle.sty</code></li>
      <li>The packages are imported using <code>\RequirePackage{my_package}</code></li>
      <li>You can import new packages like this or remove packages you don't want to use. Configuring the packages is the same in <code>.sty</code> as well as <code>main.tex</code> files.</li>
      <li>You could also add new packages as usual in the <code>main.tex</code>, but you should use the <code>.sty</code> file instead to keep your <code>main.tex</code> clean</li>
    </ol>
</details>

***

# CI/CD

You can use the GitHub-Actions located in [.github/workflows/](.github/workflows/) to build your LaTeX Project in the Cloud. See [Auto Deploy PDF on Discord](#auto-deploy-pdf-on-discord) for uploading the pdf on discord automatically after build.

## Build Latex with GitHub Actions

There are two GitHub Actions, both of which are located in [.github/workflows/](.github/workflows/):
- `Build all PDF` (finds and builds all projects in the root folder)
- `Build single PDF` (configure, which project to build)

By default `Build all PDF` is enabled and builds every single project on every `git push`.
Templates are not built, because only `main.tex` files with exactly one parent folder between them and the root are included.
The templates have two, since they are in the `_templates` directory, that's why they are ignored.

If you only work with one Latex Project per GitHub-Repository or want the CI/CD Pipeline to build all Projects on every push, you can leave the default behavior and skip the rest of this section.

You can also configure the Actions to only build one project at a time.
(useful for when you have multiple projects in your repository but only work on one at the same time.)
1. Disable `Build all PDF`
    - Either by disabling the Workflow in the GitHub Actions Tab or by commenting line 4 in the [build_all.yml](.github/workflows/build_all.yml), to make it only work on manual trigger (`workflow_dispatch`).
2. Add a repository variable by going to GitHub -> Settings -> Secrets and variables -> Actions -> Variables -> New repository variable.
    - The Name should be `PROJECT_TO_BUILD`
    - The Value should be set to the folder with the latex project you want to build, e.g. if your Latex rootfile's location is `./my_thesis/main.tex`, then the value should be `./my_thesis`. (Note that this variable has to start with `./` but cannot end in `/`)
3. Edit [build.yml](.github/workflows/build.yml)
    - Uncomment line 4 to trigger the workflow on every push.

If you want to switch the Project you work on, edit the `PROJECT_TO_BUILD` repository variable.

If you want to switch back to `Build all PDF`, delete the repository variable and edit the [build_all.yml](.github/workflows/build_all.yml) to trigger on push again.

## Auto Deploy PDF on Discord
Use a Github Action to automatically compile the project and upload the compiled pdf on your discord channel.

1. Setup Discord
    - In any of your Discord Servers (ideally private Server) choose or create a channel, where the pdf should be uploaded regularly.
    - Go to Edit Channel -> Integrations -> Webhooks -> New Webhook
    - Rename the Webhook to *GitHub* to not get confused
    - Copy the Webhook URL
2. Create Repository Secret
    - In your GitHub Repo go to Settings -> Secrets and Variables -> Actions -> New Repository Secret
    - Name: `DISCORD_WEBHOOK`
    - Secret: `<paste Webhook URL you copied from discord>`
    - Click Add secret

Both GitHub Actions (`Build all PDF` and `Build single PDF`) are programmed to always upload the PDFs to Discord, if the `DISCORD_WEBHOOK` secret is set. You don't need to configure anything else here.

If you don't want to push to discord anymore, deleting the repository secret is enough.
