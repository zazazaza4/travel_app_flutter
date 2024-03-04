String truncateString(String input, int maxLength) {
  return input.length <= maxLength
      ? input
      : input.substring(0, maxLength) + "...";
}
