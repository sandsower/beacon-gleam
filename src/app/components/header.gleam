import nakai/html

pub fn component(text: String) -> html.Node {
  html.div([], [
    html.h1([], [
      html.Text(text)
    ])
  ])
}
