## Releasing

 1. Update version file in `lib/license_plate_validator/version.rb` and run `bundle install`.
 1. Update `CHANGELOG` to reflect the changes in this release.
 1. Commit changes to `master`.
 1. Tag the release: `git tag -s vVERSION`
 1. Push changes: `git push && git push --tags`
 1. That's is. Github Actions will release the gem to Rubygems.org