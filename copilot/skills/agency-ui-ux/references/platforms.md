# Platform and context discovery

Read before choosing layouts, navigation, input behavior, motion, or material treatment. Establish facts from project instructions, source/configuration, screenshots, and the developer's brief; distinguish verified facts from assumptions. If a missing target changes the design materially, ask through the coordinator and wait for the answer instead of selecting one silently.

Record the product purpose, users and core tasks, app category, target operating systems, device classes, input methods, relevant viewport/window sizes, accessibility needs, localization, existing brand/components, stack constraints, offline/connectivity needs, and critical user journeys. Ask only for missing consequential facts. For an existing multi-platform app, preserve its supported targets; describe shared patterns and platform-specific differences.

## Mobile and tablet

Identify iOS, Android, cross-platform, mobile web, or another target. Consider reach, touch interaction, system navigation/back behavior, safe areas and keyboard occlusion, orientation, text scaling, and interrupted sessions. For tablets/foldables, explain how layouts change with available space and windowing. Use the target's conventions and existing components. Do not turn an Android product into an iOS imitation merely because Apple Design principles inform interaction quality. Avoid assigning unverified numeric touch targets as universal rules across units and platforms.

## Web

Record responsive ranges and browser/input support from the project. Cover keyboard operation, focus order and restoration, pointer and touch alternatives, zoom/reflow, semantic control behavior, and navigation history. Choose layout changes based on content and tasks, with representative small/large layouts. Browser effects and media preferences are enhancements: specify compatible fallbacks when unavailable. Web examples from the upstream skill are implementation hints for the developer, not proof that a browser API exists in a native framework.

## Desktop

Identify macOS, Windows, Linux, cross-platform native, or a web shell. Consider resizable windows, content density, keyboard shortcuts, selection, context actions, menus/toolbars, pointer precision, and multi-window workflows where relevant. Preserve target window/control conventions and project architecture. On macOS, consult Apple's platform guidance when needed; on Windows/Linux, use the relevant existing/native conventions instead of exporting macOS chrome indiscriminately.

## Other interfaces

For TV, wearable, spatial, embedded, kiosk, voice, or terminal interfaces, first identify hardware, input model, viewing context, and platform constraints. Map transferable clarity and feedback principles to that setting. Do not invent support for hover, gesture physics, glass, haptics, or touch. A terminal design may consist of information structure, command flow, prompts, output states, and keyboard navigation rather than pixel layouts. Mark missing reference evidence and consult official target documentation before specific technical recommendations.

## Cross-platform handoff

The design specification must identify which layouts, interactions, and fallback behavior apply to each target. Label proposed measurements and motion parameters as proposals until supported by project/official guidance and evaluated in the target runtime. Record why important choices serve the user's task, and what must be checked after implementation.

Reference starting points when relevant: [Apple HIG](https://developer.apple.com/design/human-interface-guidelines/), [iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios), [macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos). These are lookup targets, not claims that every current guideline or API has been verified in this package.
