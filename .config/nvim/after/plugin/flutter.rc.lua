local status, flutter = pcall(require, 'flutter-tools')
if not status then
  print('Flutter-tools is not installed')
  return
end

flutter.setup {}
