import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  // * Constants
  static const int maxCategories = 100;

  // * Variables (private state)
  int _selectedCategoryIndex = 0;
  bool _isLoading = false;
  String? _error;

  // Example: List of categories for the dashboard
  List<String> _categories = [];

  // * Constructor
  HomePageProvider() {
    // Optionally initialize state here
    fetchCategories();
  }

  // * Getters
  int get selectedCategoryIndex => _selectedCategoryIndex;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get categories => List.unmodifiable(_categories);

  // * Setters
  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  // * Methods
  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate fetching data (replace with actual logic)
      await Future.delayed(Duration(milliseconds: 300));
      _categories = ['Inbox', 'Work', 'Personal'];
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addCategory(String name) {
    if (_categories.length >= maxCategories) return;
    _categories.add(name);
    notifyListeners();
  }

  void removeCategory(int index) {
    _categories.removeAt(index);
    notifyListeners();
  }
}
