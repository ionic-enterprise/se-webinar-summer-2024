# Portals Ecommerce 

## Featured Products Micro Frontend

A micro frontend (MFE) consisting of a "Featured Products" component for Ionic Portals Ecommerce demo applications.

This micro frontend is displayed within Ionic Portals Ecommerce demos through a partial-screen Portal on the initial view of those applications. This repository is registered with <a href="https://ionic.io/docs/appflow" target="_blank">Ionic Appflow</a> to demonstrate the Live Update capabilities available when using Ionic Portals.

The following demos will use this MFE:

- [cs-portals-ecommerce-react-native](https://github.com/ionic-team/cs-portals-ecommerce-react-native)
- [portals-ecommerce-demo](https://github.com/ionic-team/portals-ecommerce-demo)

## Branches

- `main` - The initial state of the "Featured Products" micro frontend. The build output of this branch gets bundled within Ionic Portals Ecommerce demo applications.
- `update` - This branch contains commits that will be published as Live Updates within Ionic Appflow. Demo applications will pull down Live Updates made from this branch to demonstrate over-the-air updating available within a Portal.

This application runs as a standalone Capacitor application; you can run it using the <a href="https://capacitorjs.com/docs/cli" target="_blank">Capacitor CLI</a>. 

