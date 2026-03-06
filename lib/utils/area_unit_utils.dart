/// Area unit conversion utilities.
/// Storage is always in sqm. Display/input conversion when user selects sqft.
/// 1 sqft = 0.09290304 sqm
/// 1 sqm = 10.763910416709722 sqft
class AreaUnitUtils {
  static const double sqftToSqm = 0.09290304;
  static const double sqmToSqft = 1.0 / sqftToSqm;
  static const String sqmUnitLabel = 'Square Meter (sqm)';
  static const String sqftUnitLabel = 'Square Feet (sqft)';

  /// Convert area from stored sqm to display value based on selected unit.
  /// Method name is kept for backward compatibility with existing call sites.
  static double areaFromSqftToDisplay(double sqm, bool isSqm) {
    if (isSqm) return sqm;
    return sqm * sqmToSqft;
  }

  /// Convert area from display value to stored sqm.
  /// Method name is kept for backward compatibility with existing call sites.
  static double areaFromDisplayToSqft(double displayValue, bool isSqm) {
    if (isSqm) return displayValue;
    return displayValue * sqftToSqm;
  }

  /// Convert rate (e.g. ₹/sqm stored value) to display based on selected unit.
  /// Method name is kept for backward compatibility with existing call sites.
  static double rateFromSqftToDisplay(double ratePerSqft, bool isSqm) {
    if (isSqm) return ratePerSqft;
    return ratePerSqft / sqmToSqft;
  }

  /// Convert rate from display value to stored ₹/sqm value.
  /// Method name is kept for backward compatibility with existing call sites.
  static double rateFromDisplayToSqft(double displayRate, bool isSqm) {
    if (isSqm) return displayRate;
    return displayRate * sqmToSqft;
  }

  /// Get unit suffix for display (e.g. 'sqft' or 'sqm').
  static String unitSuffix(bool isSqm) => isSqm ? 'sqm' : 'sqft';

  /// Get per-area fee label for display (e.g. 'Per Sqft Fee' or 'Per Sqm Fee').
  static String perAreaFeeLabel(bool isSqm) =>
      isSqm ? 'Per Sqm Fee' : 'Per Sqft Fee';

  /// Canonical app storage/display base unit.
  static String canonicalizeAreaUnit(String? unit) => sqmUnitLabel;

  /// Check if unit string represents sqm.
  static bool isSqm(String unit) =>
      unit.toLowerCase().contains('meter') ||
      unit.toLowerCase().contains('sqm');
}
