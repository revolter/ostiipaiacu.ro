# O știi p-aia cu?

## Installation

1. Install `Ruby` by following the instructions from
   https://www.ruby-lang.org/en/documentation/installation/.
2. Install the `Ruby` dependencies by running
   ```sh
   bundle install
   ```
3. Install `Node.js` by following the instructions from
   https://docs.npmjs.com/downloading-and-installing-node-js-and-npm.
4. Install the `Node.js` dependencies by running
   ```sh
   npm install
   ```

## Usage

```sh
npm run serve
```

## Contributing

### Adding a new entry

To add a new entry to the website:
1. Create a file named
   ```
   <year>-<month>-<day>-<name>.md
   ```
   where:
   - `<year>` is the current year as 4 digits (e.g. `2014`),
   - `<month>` is the current month as 2 digits (e.g. `04`),
   - `<day>` is the current day as 2 digits (e.g. `28`),
   - `<name>` is the lowercased word that represents the first part of the joke
     (e.g. `albina`),

   For example:
   ```
   2024-04-27-albina.md
   ```
2. Edit the created file with the content
   ```liquid
   ---
   title: <name>
   solution: <solution>
   tag: <SFW or NSFW>
   source: <source?>
   ---

   {{ page.solution }}
   ```
   where:
   - `<name>` is the same `<name>` used in the file name in step `1`
   - `<solution>` is the capitalized word or phrase that represents the second
     part of the joke, with the required ending punctuation (e.g. `Roiu!`)
   - `<SFW or NSFW>` is the indicator of whether the solution is safe for work
     or not (e.g. `NSFW`),
   - `<source?>` is an optional source of the joke (e.g. `childhood`,
     `http://roblogstar.blogspot.com/2013/07/stii-bancul-cu.html`).

   For example:
   ```liquid
   ---
   title: albina
   solution: Roiu!
   tag: SFW
   source: childhood
   ---

   {{ page.solution }}
   ```

## Configuration

### Favicon

- Check if RealFaviconGenerator
  [got updated](https://realfavicongenerator.net/change_log) by running
  ```sh
  npm run check-favicon-update
  ```
- If you update [the source SVG](sources/favicon/favicon.svg), or if
  RealFaviconGenerator gets updated, update the favicon assets by running
  ```sh
  npm run update-favicon
  ```
- Check the generated (and deployed) favicon assets by going to
  https://realfavicongenerator.net/favicon_checker?protocol=https&site=ostiipaiacu.ro

## License

[GPL](LICENSE.md)
