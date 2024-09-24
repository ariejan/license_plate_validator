## Releasing

 1. Update version file in `lib/license_plate_validator/version.rb` and run `bundle install`.
 1. Update `CHANGELOG` to reflect the changes in this release.
 1. Commit changes to `master`.
 1. Tag the release: `git tag -s vVERSION`
 1. Push changes: `git push && git push --tags`
 1. Build and publish to Rubygems.org
    ```
    gem build license_plate_validator.gemspec
    gem push license_plate_validator-VERSION.gem
    ```
  1. Add a new Github release.