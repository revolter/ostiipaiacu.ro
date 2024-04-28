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
   layout: custom-post
   title: <name>
   answer: <answer>
   source: <source?>
   <NSFW tag?>
   ---

   {{ page.answer | answerify }}
   ```
   where:
   - `<name>` is the same `<name>` used in the file name in step `1`
   - `<answer>` is the lowercased word or phrase that represents the second part
     of the joke, without any ending punctuation (e.g. `roiu`)
   - `<source?>` is an optional source of the joke (e.g. `childhood`,
     `http://roblogstar.blogspot.com/2013/07/stii-bancul-cu.html`),
   - `<NSFW tag?>` is an optional `tag: NSFW` line for answers that are not safe
     for work.

   For example:
   ```liquid
   ---
   layout: custom-post
   title: albina
   answer: roiu
   source: childhood
   ---

   {{ page.answer | answerify }}
   ```

## License

[GPL](LICENSE.md)
