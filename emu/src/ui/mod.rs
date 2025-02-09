mod cpu_state;
mod memory;
mod display;

use eframe::egui;
use crate::EmuState;

pub use cpu_state::CpuStateWindow;
pub use memory::MemoryWindow;
pub use display::DisplayWindow;

pub trait Window {
  fn build<'a>(&self, window: egui::Window<'a>) -> egui::Window<'a> {
    window
  }
  fn show(&mut self, state: &mut EmuState, ui: &mut egui::Ui);
}
