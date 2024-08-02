export type Message =
  | { topic: "featured:select-item"; data: number }
  | { topic: "live-update:sync"; data: string };
