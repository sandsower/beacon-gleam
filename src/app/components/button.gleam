import nakai/html
import nakai/attr

pub type Props(a) {
  Props(
    content: String,
    class: String,
    attrs: List(attr.Attr),
  )
}

pub fn component(props: Props(t)) -> html.Node {
  html.button_text([attr.class(props.class), ..props.attrs], props.content)
}
