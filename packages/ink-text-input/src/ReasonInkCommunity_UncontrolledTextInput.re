let makeProps =
    (
      ~onSubmit: option(string => unit)=?,
      ~placeholder: option(string)=?,
      ~focus: option(bool)=?,
      ~mask: option(string)=?,
      ~highlightPastedText: option(bool)=?,
      (),
    ) => {
  "onSubmit": onSubmit,
  "placeholder": placeholder,
  "focus": focus,
  "mask": mask,
  "highlightPastedText": highlightPastedText,
};

[@bs.module "ink-text-input"] external make: React.component('a) = "UncontrolledTextInput";
