[![](https://img.shields.io/badge/license-AGPL_3.0-blue.svg)](https://opensource.org/licenses/AGPL_3.0)
[![CodeQL](https://github.com/butlergroup/storagenode-docker/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/github-code-scanning/codeql)
[![Build/CI](https://github.com/butlergroup/storagenode-docker/actions/workflows/build.yml/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/build.yml)
[![Dependabot Updates](https://github.com/butlergroup/storagenode-docker/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/dependabot/dependabot-updates)
[![OSV-Scanner](https://github.com/butlergroup/storagenode-docker/actions/workflows/osv-scanner.yml/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/osv-scanner.yml)
[![Snyk Security-Monitored](https://img.shields.io/badge/Snyk%20Security-Monitored-purple)](https://app.snyk.io/share/784f6fef-6aaf-47ed-81ba-99e05b854665)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/12136/badge)](https://www.bestpractices.dev/projects/12136)
[![Scorecard supply-chain security](https://github.com/butlergroup/storagenode-docker/actions/workflows/scorecard.yml/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/scorecard.yml)
[![Microsoft Defender For Devops](https://github.com/butlergroup/storagenode-docker/actions/workflows/defender-for-devops.yml/badge.svg)](https://github.com/butlergroup/storagenode-docker/actions/workflows/defender-for-devops.yml)
[![Feature Requests](https://img.shields.io/github/issues/butlergroup/storagenode-docker/feature-request.svg)](https://github.com/butlergroup/storagenode-docker/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement)
[![Bugs](https://img.shields.io/github/issues/butlergroup/storagenode-docker/bug.svg)](https://github.com/butlergroup/storagenode-docker/issues?utf8=✓&q=is%3Aissue+is%3Aopen+label%3Abug)

# storagenode-docker
Auto-updated Storagenode container for Storj network

## Notes on this fork
- **Important: this container has been modified to run as non-root.** This means any node operators migrating to it will need to change the ownership on all files the storagenode manages. This can be accomplished with a simple "sudo chown -R 10001:10001 *" in the directory containing storagenode folders & files (orders, retain, storage, etc.). If your node has been in operation for a long time and has a lot of files, this process will take quite some time. 
- Created to strengthen the security of the container that storagenode runs on. Uses Chainguard/wolfi-base for this reason.
- Several security scanners have been added to the repo to ensure any issues are found quickly.
- Will be maintained (depenencies/packages updated & CVEs addressed in a timely manner, etc.).

## Sponsorship/Donation

Sponsorships/Donations are happily accepted via Github Sponsors, or via Storj at 0x6E86f2734372ee559E62e6AB04Edc2b0455A86bF (my cats and I need to eat!)

## Contribution

Learn how to start contributing on the [Contributing Guidline](CONTRIBUTING.md).

## License

[AGPL 3.0](LICENSE)

## Contact

Have questions or suggestions? Reach out to us at dev@butlergroup.net. Thank you and happy coding! :)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=butlergroup/storagenode-docker&type=Date)](https://www.star-history.com/#butlergroup/storagenode-docker&Date)
