## Welcome the Aliens - A Ruby Console Application

We welcome the aliens and help them get a card for their stay on earth. 

Created in Ruby 2.1.2. 

Depends on the Prawn pdf library to generate pdf documents.

Displays the output as plain text or pdf documents.

## Running the code

```shell
$ git clone https://github.com/santumahapatra/welcome-the-aliens
$ gem install prawn
$ ruby main.rb
```
## You can write plugins for more extension types

* Write a new file with 'format_' prefix.
* Initialise the extension type and display text in the @@extension hash.
* Rewrite the export method for the specific file type.