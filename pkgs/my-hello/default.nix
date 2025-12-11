{pkgs}:
pkgs.writeShellScriptBin "my-hello" ''
  echo "----------------------------------------"
  echo "Hello! This is a custom package from your ./pkgs directory."
  echo "Running on: $(uname -a)"
  echo "----------------------------------------"
''
