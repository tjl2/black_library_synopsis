# BlackLibrarySynopsis

```shell
❯ mix run -e 'BlackLibrarySynopsis.about("the emperor running a marathon")'


The Emperor has decided to take on the ultimate challenge and run a marathon across the breadth of his empire. He hopes that by completing such an arduous task, he will gain respect from both his people and those who oppose him. With a small entourage of loyal followers, he sets off on an epic journey through treacherous landscapes, facing numerous obstacles and enemies along the way. As he struggles against fatigue and pain, the Emperor must rely upon his strength of will to reach the finish line before it's too late. Along with this physical test comes a spiritual one as well: can The Emperor find redemption in himself? Can he prove that even in times of despair there is hope in perseverance? In this novel from Black Library, readers are taken on an exciting adventure full of danger and discovery as they witness The Emperor's quest for personal triumph over adversity.
```

## Building a release runtime for AWS Lambda

1. Run the release and bootstrap tasks (_make sure you run this on an x86 machine_):

    ```shell
    MIX_ENV=production mix do release, bootstrap
    ```

2. Then you need to fix an issue in the `_build/production/rel/black_library_synopsis/bootstrap` script, which calls `foreground` instead of `start`:

    ```diff
    -    $EXE foreground
    +    $EXE start
    ```

3. Then you need to zip up the release:

    ```shell
    mix zip
    ```

    The output will be a file called `lambda.zip` in the root of the project.
