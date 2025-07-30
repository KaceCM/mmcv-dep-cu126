# mmcv dependency builder

## Description

This script will automatically download the latest releases of our own modified versions of `mmcv`, `mmdet`, and `mmseg` :

- `mmcv` from `https://github.com/KaceCM/mmcv-2.2.0-cu126`
- `mmdet` from `https://github.com/KaceCM/mmdet-3.3.0-cu126`.
- `mmseg` from `https://github.com/KaceCM/mmseg-1.2.2-cu126`

Then, it will create a release archive containing these packages, which can be used to install the dependencies in a Docker container.

> This is useful for ensuring to avoid "Too many requests" errors when installing these packages independently from all repo.