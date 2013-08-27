BEGIN {FS = "\. | \("}
/Class/ {print $0}
