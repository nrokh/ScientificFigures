#IMPRSFiguresWorkshop
 

<p align="center">

  <h1 align="center">Explaining scientific findings through figures in publications, presentations, and posters
  </h1>
  <p align="center">
    <a href="https://www.schulzscience.com/"><strong>Nataliya Rokhmanova*</strong></a>
    ·
    <a href="https://www.linkedin.com/in/mrudul-chellapurath-31530292/"><strong>Andrew K. Schulz*</strong></a>
    ·
</p>
<p float="center">
  <div align="center">
  <img src="assets/sinc_tsr.gif" />
  </div>
</p>

<!-- | Paper Video                                                                                                | Qualitative Results                                                                                                |
|------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| [![PaperVideo](https://img.youtube.com/vi/vidid/0.jpg)](https://www.youtube.com/) | -->

## Overview


This implementation:
- Morphological data included species limb information, raw 3D STL files for 3D printing. 
- The training and implementation code for:
  - Tracking the squirrel mimic using DLC
  - Extracting physical information (velocity, position, angle)
- Modeling of the squirrel morphology data for physics

<h2 align="center">3D Scanning and 3D Print files</h2>

<details>
  <summary>Details</summary>
In the folder, we have provided both raw 3D scan files as ready-to-print STL files of the Pel's scaly-tailed squirrel.

Access the files here:
```bash
git clone https://github.com/Aschulz94/ScalySquirrel
```

After that do this to install DistillBERT:

```shell
cd deps/
git lfs install
git clone https://huggingface.co/distilbert-base-uncased
cd ..
```

Install the requirements using `virtualenv` :
```bash
# pip
source scripts/install.sh
```
You can do something equivalent with `conda` as well.
</details>

[comment]: <> (## Running the Demo)

[comment]: <> (We have prepared a nice demo code to run SINC on arbitrary videos. )

<h2 align="center">DLC Training, Labeling, and Raw Videos</h2>

 <details>
  <summary>Details</summary>

<div align="center"><em>There is no need to do this step if you have followed the instructions and have done it for TEACH. Just use the ones from TEACH.</em></div>

<div align="center"><h3>Step 1: Data Setup</h3></center></div>

Download the data from [AMASS website](https://amass.is.tue.mpg.de). Then, run this command to extract the amass sequences that are annotated in babel:

</details>

<h2 align="center">Squirrel Physics Modeling</h2>

 <details>
  <summary>Details</summary>

<div align="center"><em>There is no need to do this step if you have followed the instructions and have done it for TEACH. Just use the ones from TEACH.</em></div>

<div align="center"><h3>Step 1: Data Setup</h3></center></div>

Download the data from [AMASS website](https://amass.is.tue.mpg.de). Then, run this command to extract the amass sequences that are annotated in babel:

</details>
 
## Citation

```bibtex
@inproceedings{SINC:ICCV:2022,
  title={{SINC}: Spatial Composition of {3D} Human Motions for Simultaneous Action Generation},
  author={Athanasiou, Nikos and Petrovich, Mathis and Black, Michael J. and Varol, G\"{u}l },
  booktitle = {ICCV},
  year = {2023}
}

```
## License
This code is available for all researchers to use.

## References
Many parts of this code were based on the official implementation of [DeepLabCut](https://github.com/DeepLabCut/DeepLabCut).

## Contact

This code repository was implemented by [Andrew Schulz](https://www.schulzscience.com/), [Mrudul Chellapurath](https://www.linkedin.com/in/mrudul-chellapurath-31530292/), and [Pranav Khandelwal](https://prnvkhndlwl.github.io/).

Give a ⭐ if you like.

