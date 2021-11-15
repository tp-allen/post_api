<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">Simple API</h3>

  <p align="center">
    Simple Python API with Automation files for deploying the Azure Resources and packaging them into a container.
    <br />
    <a href="https://github.com/tp-allen/simple_api"><strong>Explore »</strong></a>
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Architecture Diagram][architecture-diagram]](https://github.com/tp-allen/simple_api/docs/Simple_API_Azure.png)

A Proof of concept consisting of a single web-application and a single database.
The service will accept a POST request that will persist the timestamp of that event into a database.


<p align="right">(<a href="#top">back to top</a>)</p>


### Built With

* [Flask](https://flask.palletsprojects.com)
* [Docker](https://docker.io/)
* [Azure](https://azure.com/)
* [Terraform](https://terraform.com/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/tp-allen/simple_api.git
   ```
2. Install PIP Modules
   ```sh
   pip install -r requirements.txt
   ```
3. Build Docker Image
   ```sh
   docker build -t time_app .
   ```
4. Run Docker Container
   ```sh
   docker run -d --env-file ./env.list -p 5000:5000 time_app
   ```


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

The web API can use a curl command (curl -X POST http://app-timeapp-dev-001.azurewebsites.net/date) 

The deployment of the App has been automated for use within Azure DevOps Pipelines.

The deployment of the resources has been terrafromed and can be created using the following tf commands.
```sh
terrafrom init
terraform plan -var-file terraform.tfvars
terraform apply -var-file terraform.tfvars
```

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Add Log Analytics resources
- [ ] Scale-Up Scale-Down events
- [ ] Backup and Restore DB
- [ ] Add Multi-region Support
    - [ ] Additional Instances
    - [ ] Azure CDN

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@tp_allen_](https://twitter.com/tp_allen_) - tallenp@me.com

Project Link: [https://github.com/tp-allen/simple_api](https://github.com/tp-allen/simple_api)

<p align="right">(<a href="#top">back to top</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/tp-allen/simple_api.svg?style=for-the-badge
[contributors-url]: https://github.com/tp-allen/simple_api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/tp-allen/simple_api.svg?style=for-the-badge
[forks-url]: https://github.com/tp-allen/simple_api/network/members
[stars-shield]: https://img.shields.io/github/stars/tp-allen/simple_api.svg?style=for-the-badge
[stars-url]: https://github.com/tp-allen/simple_api/stargazers
[issues-shield]: https://img.shields.io/github/issues/tp-allen/simple_api.svg?style=for-the-badge
[issues-url]: https://github.com/tp-allen/simple_api/issues
[license-shield]: https://img.shields.io/github/license/tp-allen/simple_api.svg?style=for-the-badge
[license-url]: https://github.com/tp-allen/simple_api/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/tallenp
[product-screenshot]: images/screenshot.png