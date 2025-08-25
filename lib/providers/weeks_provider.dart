import 'package:flutter/material.dart';
import '../models/types.dart';
import '../services/weeks_api.dart';

class WeeksProvider with ChangeNotifier {
  WeekMenu? currentMenu;
  bool isLoading = false;
  String? error;

  Future<void> loadLatestMenu() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      currentMenu = await WeeksApi.fetchMenu();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMenuByWeek(String weekLabel) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      currentMenu = await WeeksApi.fetchMenu(week: weekLabel);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMenuByDate(String dateIso) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      currentMenu = await WeeksApi.fetchMenu(date: dateIso);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
