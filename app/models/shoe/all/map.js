function(doc, meta) {
  {
    emit(meta.id, [doc.Name, doc.Size, doc.Price, doc.Color]);
  }
}