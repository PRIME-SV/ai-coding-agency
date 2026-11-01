# Test execution procedure

Discover the project's documented environment and commands; inspect package/build metadata when needed. Prefer existing tooling. Map acceptance criteria to a normal case plus meaningful boundary/failure/regression cases. For a bug fix, demonstrate the relevant failure before and success after when practical. Add tests that could detect a real regression rather than merely mirror implementation.

Execute the relevant build/static checks and focused tests. Broaden only when project requirements or change impact justify it. Capture command, working directory, exit status, and useful output; redact secrets. A test that did not run is skipped or blocked, never passed. Document environmental failures separately from product defects. Do not install unnecessary dependencies or access external services outside task authorization.

For UI tasks, exercise relevant interactions and states with available browser/app tools. Check representative viewport behavior and keyboard/accessibility behavior appropriate to the change. Distinguish automated assertions, manual visual observation, and source-only checks. If execution tools or the runtime are unavailable, report exactly what remains unverified. Return reproducible failures to the coordinator for developer fixes; retest the changed state and affected regressions afterward.
