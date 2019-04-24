# Hash Collisions

Program finds two strings that make collision.
It is also possible to find two strings with the same prefix.

Application is created to handle many hash function, although currently only one is available.
You're free to add more ;)

### Requirements
 - Elxir > 1.6
 
### Usage 
 - Type `iex -S mix` to open interactive shell
 - Set prefix if needed `Collisions.Hash.XXX.set_prefix(prefix)`
 - Run main function and pass it hash function and first message `Collisions.Floyd.run(&Collisions.Hash.XXX.run/1, "")`
 
 This will take a while to compute
